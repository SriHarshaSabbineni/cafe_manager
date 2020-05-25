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

  def pending_orders
    if (current_user.role == "clerk" or current_user.role == "admin")
      render "pending_orders"
    else
      redirect_to "/"
    end
  end

  def mark_as_delivered
    if (current_user.role == "clerk" or current_user.role == "admin")
      id = params[:id]
      order = Order.find(id)
      order.delivered_at = Date.today
      order.save
      redirect_to "/pending_orders"
    else
      redirect_to "/"
    end
  end

  def walkin_costumer
    if (current_user.role == "clerk" or current_user.role == "admin")
      walkin_costumer = User.find_by(email: "walkin@gmail.com")
      Order.create!(
        date: Date.today,
        user_id: walkin_costumer.id,
        status: "created",
      )
      redirect_to "/walkin_costumer"
    else
      redirect_to "/"
    end
  end

  def walkin_costumer_order_confirm
    if (current_user.role == "clerk" or current_user.role == "admin")
      id = params[:id]
      order = Order.find(id)
      order.status = "confirmed"
      order.date = Date.today
      order.save
      redirect_to "/walkin_costumer"
    else
      redirect_to "/"
    end
  end

  def walkin_costumer_orders
    if (current_user.role == "clerk" or current_user.role == "admin")
      walkin_costumer = User.find_by(email: "walkin@gmail.com")
      render "walkin_costumer", locals: { walkin_costumer: walkin_costumer }
    else
      redirect_to "/"
    end
  end
end
