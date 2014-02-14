class GalleryImage < Image

  before_create :set_file_name

  protected

  def set_file_name
    begin
      name = SecureRandom.uuid
    end while not Image.where(:attachment_file_name => name).empty?
    extension = self.attachment_content_type.gsub('image/', '.')
    self.attachment.instance_write(:file_name, name+extension)
  end

end