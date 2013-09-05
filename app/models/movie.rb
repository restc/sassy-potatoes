class Movie < ActiveRecord::Base

	def self.sort_collection
		@sort_collection = Movie.sort_by(params[])
	end
	
end
