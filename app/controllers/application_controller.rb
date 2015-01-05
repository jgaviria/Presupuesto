class ApplicationController < ActionController::Base
  before_action :authorize




  protected

  def authorize

    unless User.find_by(id: session[:user_id])
    redirect_to login_url, notice: "Please log in" end

  end

 def set_relation
  user = User.find_by(id: session[:user_id])

     $sess_name = user.name

 end

end


