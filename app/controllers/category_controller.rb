class CategoryController < ApplicationController

def index
	@categories = Category.all
end






	private

	def category_params
		params.require(:category).permit(:id, :name) 
	end
end
