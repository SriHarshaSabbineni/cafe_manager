class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new_costumer
    render "users/new_costumer"
  end

  def clerk
    render "users/clerk"
  end

  def create
    new_user = User.new(
      name: params[:name],
      email: params[:email],
      role: params[:role],
      password: params[:password],
    )
    if new_user.save
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to "/admin_home"
  end
end
