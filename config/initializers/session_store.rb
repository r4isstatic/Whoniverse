# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_whoniverse_session',
  :secret      => '633021bdf24e1d6aac7b2fc682b509ff8c9fcf5405aeade846194678e09340efdc2b78e82760a300ec047dccd36cbd24eb80281027cb041203989b5a7b44abb8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
