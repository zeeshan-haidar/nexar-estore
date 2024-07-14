# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil),
    region: ENV.fetch('AWS_REGION', nil)
  }
  config.fog_directory  = ENV.fetch('AWS_BUCKET', nil)
  config.fog_public     = false
  config.storage        = :fog

  config.cache_storage = :fog
end
