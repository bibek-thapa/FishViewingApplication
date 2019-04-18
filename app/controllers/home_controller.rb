class HomeController < ApplicationController

	def index
		@fishes=Fish.last(3)

	end

end
