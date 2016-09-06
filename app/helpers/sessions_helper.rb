module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def img_gen
    	 @img_gen = "http://capture.heartrails.com/200x200/border?"
  end

  def init_tag
     @init_tag = Origin.where(user_id: nil)
  end
end
