class EdiblesController < ApplicationController
	before_action :ensure_login, only: [:new, :create, :edit, :update]

	def index
		@edibles = Edible.all
	end

	def new
		@edible = Edible.new
	end

end
