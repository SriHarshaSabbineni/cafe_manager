class UsersController < ApplicationController
  def new_costumer
    render "users/new_costumer"
  end

  def create
    User.create!(
      name: params[:name],
      email: params[:email],
      role: params[:role],
    )
    redirect_to "/"
  end
end
