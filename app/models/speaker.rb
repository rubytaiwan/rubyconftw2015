class Speaker < ActiveRecord::Base
 mount_uploader :avatar, AvatarUploader
end
