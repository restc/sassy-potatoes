# Be sure to restart your server when you modify this file.

Rottenpotatoes::Application.config.session_store :active_record_store
# This is the original storage  configuation 		 :cookie_store, key: '_rottenpotatoes_session'
ActiveRecord::SessionStore.session_class = Session 
# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Rottenpotatoes::Application.config.session_store :active_record_store
