class Video
  mount_uploader :file, VideoUploader

  def set_success(format, opts)
    self.success = true
  end
end
