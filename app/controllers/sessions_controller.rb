class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email], role: params[:role])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = "Invalid attempt! Please try again."
      redirect_to "/signin"
    end
  end

  def costumer_home
    if (current_user.role == "costumer")
      render "costumer_home"
    else
      redirect_to "/"
    end
  end

  def clerk_home
    if (current_user.role == "clerk")
      render "clerk_home"
    else
      redirect_to "/"
    end
  end

  def admin_home
    if (current_user.role == "admin")
      render "admin_home"
    else
      redirect_to "/"
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end

  def reports
    if (current_user.role == "admin")
      render "reports"
    else
      redirect_to "/"
    end
  end
end
