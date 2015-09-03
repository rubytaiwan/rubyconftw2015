class Speaker < ActiveRecord::Base
  extend ::CarrierWave::LocalFileAssignable
  mount_uploader :avatar, AvatarUploader
  makr_uploader_local_assignable :avatar

  validates :dom_id, :name, presence: true, length: { maximum: 50 }
  validates :dom_id, :name, uniqueness: true
#  validates :home_page, uniqueness: true, allow_nil: true
  before_create do
    self.sort_order = self.class.maximum(:sort_order) + 1 unless self.sort_order.present?
  end

  def self.resort(ids)
    self.transaction do
      ids.each_with_index do |id, so|
        self.where(id: id).update_all sort_order: so
      end
    end
  end

  def twitter_url
    "http://twitter.com/#{twitter}"
  end

  def github_url
    "http://github.com/#{github}"
  end
end
