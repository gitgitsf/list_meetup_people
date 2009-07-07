# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ruby-6_session',
  :secret      => '1f1515e1ee7b202d2a196cc6e4884600fc6d1f39275d25855eaa487587a0c6d27fa4ac9f243d24fcd0ac0d6f6b2d2432e8cdf8c9a3318afa7f4516a314f74b85'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
