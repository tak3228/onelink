class LinksController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new
    @link.url = params[:link][:url]
    @link.title = params[:link][:title]
    @link.bunrui = params[:link][:id]
    if
      @link.save
      flash[:success] = 'リンクが作成されました'
      redirect_to root_path
    else
      redirect_to new_link_path
    end
  end
end
