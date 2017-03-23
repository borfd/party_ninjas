# config/initializers/carrierwave.rb

require 'mini_magick'
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.test? or Rails.env.cucumber? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
        :provider               => 'AWS',
        :aws_access_key_id      => ENV['S3_KEY'],
        :aws_secret_access_key  => ENV['S3_SECRET'],
        :region                 => ENV['S3_REGION'] # Change this for different AWS region. Default is 'us-east-1'
    }
    config.fog_directory  = ENV['S3_BUCKET']
  end
end


module CarrierWave
  module MiniMagick
    # round _square_ image
    def round
      manipulate! do |img|
        img.format 'png'

        width = img[:width]-2
        radius = width/2

        mask = ::MiniMagick::Image.open img.path
        mask.format 'png'

        mask.combine_options do |m|
          m.alpha 'transparent'
          m.background 'none'
          m.fill 'white'
          m.draw 'roundrectangle 1,1,%s,%s,%s,%s' % [width, width, radius, radius]
        end

        overlay = ::MiniMagick::Image.open img.path
        overlay.format 'png'

        overlay.combine_options do |o|
          o.alpha 'transparent'
          o.background 'none'
          o.fill 'none'
          o.stroke 'white'
          o.strokewidth 2
          o.draw 'roundrectangle 1,1,%s,%s,%s,%s' % [width, width, radius, radius]
        end

        masked = img.composite(mask, 'png') do |i|
          i.alpha "set"
          i.compose 'DstIn'
        end

        masked.composite(overlay, 'png') do |i|
          i.compose 'Over'
        end
      end
    end
  end
end


