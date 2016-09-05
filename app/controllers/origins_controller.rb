class OriginsController < ApplicationController
	before_action :logged_in_user
	before_action :set_origin, only: [:edit, :update]
	def new 
		@origin = Origin.new
	end

	def show
		
	end

	def update
		if @origin.update(origin_params)
			flash[:success] = '変更を保存しました'
			redirect_to origin_path
		else
			render 'edit'
		end
	end

	def edit
		@links = Link.where(bunrui: @origin)
	end

	def create
		@origin = Origin.new(origin_params)
		@origin.user_id = current_user.id
	  if @origin.save
			flash[:success] = 'タグを作成しました'
			redirect_to origin_path(current_user) 
		else
			render 'new'
		end
	end

	def destroy
		@tags = Origin.find(params[:id])
			@tags.destroy
			flash[:success] = 'タグを削除しました'
			redirect_to origin_path 
	end





	private

	def origin_params
		params.require(:origin).permit(:content)
	end
	def set_origin
		@origin = Origin.find(params[:id])
	end
end
