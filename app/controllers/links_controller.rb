class LinksController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    #@link.url = params[:link][:url]
    @link.title = @link.getpagetitle
    # @link.title = params[:link][:title]
    # @link.bunrui = params[:link][:id]
    if @link.save
      flash[:success] = 'リンクが作成されました'
      redirect_to root_path
    else
      render 'new'
      # redirect_to new_link_path ←リダイレクトさせてしまうと@link.errorsの内容が消えてしまう
    end
  end
  

  
  private
  
  def link_params
    params.require(:link).permit(:url, :title, :bunrui)
  end
end
