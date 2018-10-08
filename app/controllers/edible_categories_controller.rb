class EdibleCategoriesController < ApplicationController
	before_action :ensure_login, only: [:new, :create]

	def index
    	@ediblecats = EdibleCategory.all.sort_by(&:name)
 	 end

	def new
		@ediblecat = EdibleCategory.new
	end

	def create
	    @ediblecat = EdibleCategory.create(ediblecategory_params)
	    if @ediblecat.save
	      redirect_to ediblecategory_path(@ediblecat)
	    else
	      render 'new'
	    end
  	end

end
