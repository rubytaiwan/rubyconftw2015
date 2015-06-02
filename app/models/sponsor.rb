class Sponsor < ActiveRecord::Base
 mount_uploader :image, AvatarUploader
end
