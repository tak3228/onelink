class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :show]
	before_action :correct_user, only: [:edit, :update]


	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "さぁ、始めましょう!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "変更内容を更新しました"
			redirect_to @user
		else
			render 'edit'
		end
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password,
																 :password_confirmation)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def correct_user
		redirect_to root_path if @user != current_user
	end
end
