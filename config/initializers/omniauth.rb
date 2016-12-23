require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :spotify, "4aaa5cb3a3f2433588833c3bf1f1bad3", "4969e08114774a66a5fb923a615e2278", scope: 'playlist-read-private'
end