class HeaderImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{Rails.env}/avatars/#{model.id}"
  end
end
