class EdiblesController < ApplicationController
	
	def index
		@edibles = Edible.all
	end

end
