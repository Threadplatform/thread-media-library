OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_API_CLIENT_ID'], ENV['GOOGLE_API_CLIENT_SECRET'], {}
end
