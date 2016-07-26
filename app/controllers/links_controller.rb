class LinksController < ApplicationController
	before_action :logged_in_user, only: [:new]

	def create 
		@link = current_user.links.build(link_params)
		if @link.save
			flash[:success] = "リンクが作成されました"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	private
	def link_params
		params.require(:link).permit(:url, :title, :bunrui)
	end

end
