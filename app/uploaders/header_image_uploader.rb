class HeaderImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :fix_exif_rotation

  def store_dir
    "uploads/#{Rails.env}/avatars/#{model.id}"
  end
end
