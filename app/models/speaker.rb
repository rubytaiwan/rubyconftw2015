class Speaker < ActiveRecord::Base
 mount_uploader :avatar, AvatarUploader
 validates :name,  presence: true, length: { maximum: 50 }
end
