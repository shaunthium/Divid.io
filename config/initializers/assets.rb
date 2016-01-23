# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( pubnub.js main.js videosync.js stanko.js stanko.css)

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << "#{Rails.root}/app/assets/videos"

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
