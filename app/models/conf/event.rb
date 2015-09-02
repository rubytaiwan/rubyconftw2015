class Conf::Event < ActiveRecord::Base
  has_many :activities
  has_many :attendees, through: :activities
  belongs_to :resource, polymorphic: true

  CATEGORY_SESSION = "session"
  RESOURCE_TYPES = [Sponsor.name,Speaker.name]

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

  def self.all_session
    Conf::Event.where(category: CATEGORY_SESSION).all
  end

  def self.all_event
    Conf::Event.where.not(category: CATEGORY_SESSION).all
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

  def sponser
    if ! self.is_session?
      self.resource
    end
  end
  def sponser=(resource)
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
end
