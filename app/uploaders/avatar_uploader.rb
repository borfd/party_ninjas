class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fill: [200, 200]
  process :round

  def store_dir
    "uploads/#{Rails.env}/avatars/#{model.id}"
  end
end
