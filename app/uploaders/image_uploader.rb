class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

process :resize_to_limit => [500, 500]


  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(png jpg)
  end

  def filename
    original_filename if original_filename
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
    # For Rails 3.1+ asset pipeline compatibility:
    ActionController::Base.helpers.asset_path([version_name, "default.png"].compact.join('_'))
  end

end
