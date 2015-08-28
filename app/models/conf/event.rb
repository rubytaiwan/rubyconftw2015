class Conf::Event < ActiveRecord::Base
  has_many :activities
  has_many :attendees, through: :activities
end
