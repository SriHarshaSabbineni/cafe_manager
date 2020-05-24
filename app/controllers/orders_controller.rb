class OrdersController < ApplicationController
  def index
  end

  def create
    Order.create!(
      date: Date.today,
      user_id: current_user.id,
      status: "created",
    )
    redirect_to "/orders"
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.status = "confirmed"
    order.save
    redirect_to "/costumer_home"
  end
end
