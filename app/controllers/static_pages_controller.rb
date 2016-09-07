class StaticPagesController < ApplicationController

  def home
    @links = []
    bunruis = Origin.all.pluck(:id)
    bunruis.each do |bunrui|
      link_temp = current_user.links.where(bunrui: bunrui).flatten if logged_in?
      @links << link_temp.reverse if link_temp
    end


		@link_box= []
		@links.each do |link|
			link.each do |k|
			@link_box << k
		end
		end

  end
end
