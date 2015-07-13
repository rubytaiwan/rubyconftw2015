class Sponsor < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  LEVELS = (1..6)

end
