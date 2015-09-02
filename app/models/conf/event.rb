class Conf::Event < ActiveRecord::Base
  has_many :activities
  has_many :attendees, through: :activities

  CATEGORY_SESSION = "session"

  def activity=(activity)
    @activity=activity
  end
  def activity
    @activity
  end

  def is_session?
    category == CATEGORY_SESSION
  end

  def self.all_session
    Conf::Event.where(category: CATEGORY_SESSION).all
  end

  def self.all_event
    Conf::Event.where.not(category: CATEGORY_SESSION).all
  end

end
