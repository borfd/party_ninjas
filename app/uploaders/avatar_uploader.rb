class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :fix_exif_rotation
  process resize_to_fill: [200, 200]
  process :round

  def store_dir
    "uploads/#{Rails.env}/avatars/#{model.id}"
  end

  def fix_exif_rotation #this is my attempted solution
    manipulate! do |img|
      img.tap(&:auto_orient)
    end
  end
end
