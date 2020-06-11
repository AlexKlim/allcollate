require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  if Rails.env.test?
    config.storage = :file
    config.root = Rails.root.join('tmp')
  else
    config.storage = :fog

    config.fog_credentials = {
      provider: 'AWS', # required
      aws_access_key_id: Rails.application.credentials.aws[:uploads_access_key_id], # required
      aws_secret_access_key: Rails.application.credentials.aws[:uploads_secret_access_key], # required
      region: 'us-east-1'
    }

    config.fog_directory  = Rails.application.credentials.aws[:fog_upload_bucket] # required
    config.fog_public     = true                                    # optional, defaults to true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{60.days.to_i}" }
    config.remove_previously_stored_files_after_update = false
  end
end
