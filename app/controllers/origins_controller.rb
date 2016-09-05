class OriginsController < ApplicationController
	before_action :logged_in_user
	def new 
		@origin = Origin.new
	end

	def create
		@origin = Origin.new(origin_params)
		@origin.user_id = current_user.id
	  if @origin.save
			flash[:success] = 'タグを作成しました'
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		@tags = Origin.find(params[:id])
		@tags.destroy
		flash[:success] = 'タグを削除しました'
		redirect_to root_path
	end





	private

	def origin_params
		params.require(:origin).permit(:content)
	end
end
