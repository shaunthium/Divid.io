class Session < ActiveRecord::Base
  mount_uploader :video, VideoUploader
  attr_accessor :num_people
end
