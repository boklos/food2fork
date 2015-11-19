require 'httparty'


FOOD2FORK_KEY = "f8249a8a3d22f3593f9381796b4e883c"


class Recipe


include HTTParty

	base_uri 'http://food2fork.com/api'
	default_params key: ENV["FOOD2FORK_KEY"] ,
	fields: "title,f2f_url,social_rank,image_url", q: "search"
	format :json


	def self.for term
		get("/search", query: { q: term }) ["recipes"]
	end
end


