class Speaker < ActiveRecord::Base
  extend ::CarrierWave::LocalFileAssignable
  mount_uploader :avatar, AvatarUploader
  makr_uploader_local_assignable :avatar

  validates :name,  presence: true, length: { maximum: 50 }

  def self.resort(ids)
    self.transaction do
      ids.each_with_index do |id, so|
        self.where(id: id).update_all sort_order: so
      end
    end

  end
end
