class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end


  def index
  end


  def create

    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
   session[:user_id] = user.id
   $sess_name = user.name.to_s
      redirect_to new_budget_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end



  def destroy
    session[:user_id] = nil
    $sess_name = nil
    redirect_to login_url, notice: "Logged out"
  end
end

