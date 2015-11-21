class CollegesController < ApplicationController
	def index
		colleges = Collage.all
	end
end
