class StaticPagesController < ApplicationController

  def home
    @link = current_user.links.build if logged_in?
    @links = []
    bunruis = Origin.all.pluck(:id)
    bunruis.each do |bunrui|
      link_temp = current_user.links.where(bunrui: bunrui).flatten if logged_in?
      @links << link_temp.reverse if link_temp
    end
  end
end
