host = Rails.application.credentials.redis ? Rails.application.credentials.redis[:host] : 'localhost'
port = Rails.application.credentials.redis ? Rails.application.credentials.redis[:port] : 6379

config = { url: "redis://#{host}:#{port}/" }

Sidekiq.configure_server do |c|
  c.redis = config
end

Sidekiq.configure_client do |c|
  c.redis = config
end

# Redis Cron
# schedule_file = 'config/schedule.yml'

# if File.exists?(schedule_file)
#   config = YAML.load_file(schedule_file)
#   Sidekiq::Cron::Job.destroy_all!
#   Sidekiq::Cron::Job.load_from_hash config

#   # Disable all cron tasks for test envs
#   Sidekiq::Cron::Job.all.map(&:disable!) unless Rails.env.production?
# end
