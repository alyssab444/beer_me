Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['72d57b9642ae9235565f'], ENV['aef763ddff4077b41e6dfc3881a5a8a3a1edd029'], :redirect_uri => ENV['localhost:3000/auth/github/callback'], scope: 'user:email'
end
