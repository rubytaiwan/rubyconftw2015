class Conf::Event < ActiveRecord::Base
  include CodemeccFetchable
  has_many :activities
  has_many :attendees, through: :activities
  belongs_to :resource, polymorphic: true

  URL_EVENTS = 'https://www.codeme.cc/api/event/?format=json'
  URL_BADGES = 'https://www.codeme.cc/api/badge/?format=json'

  CATEGORY_SESSION = Speaker.name
  RESOURCE_TYPES = [Sponsor.name,Speaker.name]

  validate :check_slug, on: :create

  def activity=(activity)
    @activity=activity
  end

  def activity
    @activity
  end

  def is_session?
    # category == CATEGORY_SESSION
    self.resource.class == Speaker
  end

  def self.all_categorized
    Conf::Event.all.preload(:resource).all.group_by { |e| e.is_session? ? :session : :badge }
  end

  def self.all_session
    Conf::Event.all_categorized[:session]
  end

  def self.all_session
    Conf::Event.all_categorized[:badge]
  end

  def self.all_badge
    Conf::Event.where.not(resource_type: CATEGORY_SESSION).all
  end

  def self.resource_types
    RESOURCE_TYPES
  end

  def image
    if self.is_session?
      self.resource.avatar.middle
    else
      self.resource.twox_image.url
    end
  end

  def stripe_multi_point_number
    self.name = self.name[0..-3]
    self.slug = self.slug[0..-3]
  end

  def multi_track?
    !! self.name.rindex('Track')
  end

  def stripe_multi_track
    self.name = self.name[0..-11]
    self.slug = self.slug[0..-3]
  end

  def attendee_priority
    if self.is_session?
      self.attendee_priority_as_session
    else
      self.attendee_priority_as_badge
    end
  end

  def attendee_priority_as_session
    (self.activity ? 0 : 1000) + (self.resource ? self.resource.sort_order : 0)
  end

  def attendee_priority_as_badge
    (self.activity ? 0 : 1000) + (self.resource ? self.resource.level : 0)
  end

  def sponsor
    if ! self.is_session?
      self.resource
    end
  end
  def sponsor=(resource)
    self.resource = resource
  end

  def speaker
    if self.is_session?
      self.resource
    end
  end

  def speaker=(resource)
    self.resource = resource
  end

  def category_cc=(val)
    if val =~ /^\[.+?\]\s(.+?)$/
      self.category = $1
    end
  end

  def begin=(val)
    self.begins_at = DateTime.parse(val)
  end

  def end=(val)
    self.ends_at = DateTime.parse(val)
  end

  def self.fetch_from_remote(url: nil, results: [], &block)
    remote_result = fetch_codemecc_api(url)
    self.transaction do
      remote_result["results"].each do |res|
        res.deep_symbolize_keys!
        unless self.find_by(slug: res[:slug])
          block.call res
        end
      end
    end
    if remote_result["next"].present?
      fetch_from_remote(url: remote_result["next"], results: results, &block)
    else
      results
    end
  end

  def self.fetch_badges_from_remote(url: URL_BADGES, results: [])
    fetch_from_remote(url: url, results: results) do |res|
      res[:category] = :badge
      self.create!(res)
    end
  end

  def self.fetch_events_from_remote(url: URL_EVENTS, results: [])
    fetch_from_remote(url: url, results: results) do |res|
      self.create!(
        name: res[:name],
        category_cc: res[:category],
        begins_at: res[:begin],
        ends_at: res[:end],
        slug: res[:slug])
    end
  end

  protected

  def check_slug
    if slug =~ /.+(keynote|session)\-(.+?)\-r\d\-\d$/
      self.speaker = Speaker.find_by(dom_id: $2)
    end
  end

end
