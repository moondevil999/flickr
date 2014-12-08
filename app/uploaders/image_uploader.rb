class ImageUploader < CarrierWave::Uploader::Base

  def store_dir
    'images'
  end
end