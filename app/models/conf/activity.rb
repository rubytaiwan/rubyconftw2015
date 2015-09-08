class Conf::Activity < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :event
  include CodemeccFetchable

  REMOTE_URL = "https://www.codeme.cc/api/activity/?format=json"

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

  def self.fetch_codemecc_json(after_id: nil, acts_created: [])
    url = REMOTE_URL
    url << "&after_id=#{after_id}" if after_id
    logger.info "Start fetch activities from #{url}"
    remote_result = fetch_codemecc_api(url)
    last_id = nil
    self.transaction do
      remote_result["results"].each do |res|
        res.deep_symbolize_keys!
        unless self.find_by(id: res[:id])
          last_id = res[:id]
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
    if remote_result['next'].present?
      return fetch_codemecc_json(after_id: last_id, acts_created: acts_created)
    else
      return acts_created
    end
  end
end
