class LinksController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    @link.title = @link.getpagetitle
    if @link.save
      flash[:success] = 'リンクが作成されました'
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
		flash[:success] = 'リンクを削除しました'
    redirect_to :root
  end


  private

  def link_params
    params.require(:link).permit(:url, :title, :bunrui)
  end
end
