class ApplicationController < ActionController::Base
	config.action_dispatch.session_store = :active_record_store
  protect_from_forgery
  # before_filter persist_movies_session


end
