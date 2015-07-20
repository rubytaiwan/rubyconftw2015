class Sponsor < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  mount_uploader :twox_image, AvatarUploader
  LEVELS = (1..6)

end
