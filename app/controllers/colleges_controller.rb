class CollegesController < ApplicationController
	def index
		colleges = College.all
	end
end
