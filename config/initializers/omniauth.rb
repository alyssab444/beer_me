Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '45423309a20bd9cbeee1', '64c9eeaa88df84bf08dfbe0d31eb75a06401f640'
end
