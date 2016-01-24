class Session < ActiveRecord::Base
  mount_uploader :video, VideoUploader
end
