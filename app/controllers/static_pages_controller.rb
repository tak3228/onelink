class StaticPagesController < ApplicationController
  def home
	  @link = current_user.links.build if logged_in?
  end
end
