class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email], role: params[:role])
    if user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    end
  end

  def costumer_home
    current_user
    render "costumer_home"
  end

  def clerk_home
    render "clerk_home"
  end

  def admin_home
    render "admin_home"
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end

  def reports
  end
end
