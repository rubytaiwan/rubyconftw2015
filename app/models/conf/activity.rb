class Conf::Activity < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :event

  REMOTE_URL = "https://www.codeme.cc/api/activity/?format=json"
  AUTH_HEADER = Settings.codemecc.auth_header

  def event_attrs=(eattrs)
    e = ::Conf::Event.find_by(slug: eattrs[:slug])
    if e
      self.event = e
    else
      self.build_event(eattrs)
    end
  end

  def created=(t)
    self.happened_at = Time.parse(t)
  end

  def self.fetch_codemecc_json(after_id: nil)
    url = REMOTE_URL
    url << "&after_id=#{after_id}" if after_id
    logger.info "Start fetch activities from #{url}"
    remote_result = JSON.parse(open(url, "Authorization" => AUTH_HEADER).read)
    acts_created = []
    self.transaction do
      remote_result["results"].each do |res|
        res.deep_symbolize_keys!
        unless self.find_by(id: res[:id])
          kktix = res.delete(:kktix)
          event_attrs = res.delete(:event)
          act = self.new(res)
          act.event_attrs = event_attrs
          act.attendee = ::Conf::Attendee.find_by(check_code: kktix[:kktix_code])
          act.save!
          acts_created << act
        end
      end
    end
    acts_created
  end
end
