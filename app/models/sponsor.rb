class Sponsor < ActiveRecord::Base
  has_many :events, as: :resource
  mount_uploader :image, AvatarUploader
  mount_uploader :twox_image, AvatarUploader
  LEVELS = (1..6)

end
