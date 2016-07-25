class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update]
	before_action :current_user, only: [:edit, :update]
  def show
	  @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
	    flash[:success] = "さぁ、始めましょう!"
	    redirect_to @user
    else
      render 'new'
    end
  end
  def edit
	  @user = User.find(params[:id])
  end
  def update
	  @user = User.find(params[:id])
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
end
