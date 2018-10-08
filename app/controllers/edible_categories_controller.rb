class EdibleCategoriesController < ApplicationController
	before_action :ensure_login, only: [:new, :create]

	def index
    	@ediblecats = EdibleCategory.all.sort_by(&:name)
 	 end

	def new
		@ediblecat = EdibleCategory.new
	end

	def show
		@ediblecat = EdibleCategory.fing_by(params[:id])
		@edibles = @ediblecat.edibles
	end

	def create
	    @ediblecat = EdibleCategory.create(ediblecategory_params)
	    if @ediblecat.save
	      redirect_to edible_category_edibles_path(@ediblecat)
	    else
	      render 'new'
	    end
  	end

  	private

  	def ediblecategory_params
  		params.require(:edible_category).permit(:name)
  	end

end
