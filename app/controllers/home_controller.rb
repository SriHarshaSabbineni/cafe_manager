class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    if current_user
      if current_user.role == "costumer"
        redirect_to costumer_home_path
      elsif current_user.role == "clerk"
        redirect_to clerk_home_path
      elsif current_user.role == "admin"
        redirect_to admin_home_path
      end
    else
      render "index"
    end
  end
end
