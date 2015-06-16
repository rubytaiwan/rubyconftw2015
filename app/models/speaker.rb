class Speaker < ActiveRecord::Base
 extend ::CarrierWave::LocalFileAssignable
 mount_uploader :avatar, AvatarUploader
 makr_uploader_local_assignable :avatar

 validates :name,  presence: true, length: { maximum: 50 }
end
