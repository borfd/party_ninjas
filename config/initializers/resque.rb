rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
rails_env = ENV['RAILS_ENV'] || 'development'

if rails_env == 'development'
  Resque.redis = "localhost:6379"
else
  Resque.redis = if ENV["RAILS_ENV"] == "production" && (c = CF::App::Credentials.find_by_service_tag('redis'))
   Addressable::URI.new(scheme: 'redis', host: c.fetch('hostname'), password: c.fetch('password'), port: c.fetch('port')).to_s
 end
end
