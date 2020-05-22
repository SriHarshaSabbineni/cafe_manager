class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email], role: params[:role])
    if user.authenticate(params[:password])
      if user.role == "costumer"
        redirect_to costumer_home_path
      elsif user.role == "clerk"
        redirect_to clerk_home_path
      elsif user.role == "admin"
        redirect_to admin_home_path
      end
    end
  end

  def costumer_home
    render "costumer_home"
  end

  def clerk_home
    render "clerk_home"
  end

  def admin_home
    render "admin_home"
  end
end
