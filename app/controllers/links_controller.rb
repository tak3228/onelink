class LinksController < ApplicationController
	before_action :logged_in_user, only: [:new]

	def new 
		@link = current_user.links.build
		if @link.save
			flash[:success] = "リンクが作成されました"


		render 'links/new'
		
	end


	end
end

