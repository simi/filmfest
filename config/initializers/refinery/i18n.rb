# encoding: utf-8

Refinery::I18n.configure do |config|
  config.enabled = true

  config.default_locale = :cs

  config.current_locale = :cs

  config.default_frontend_locale = :cs

  config.frontend_locales = [:cs]

  config.locales = {:cs=>"Česky"}
end
