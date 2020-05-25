class OrderItemsController < ApplicationController
  def create
    OrderItem.create!(
      order_id: params[:order_id],
      menu_item_id: params[:menu_item_id],
      menu_item_name: params[:menu_item_name],
      menu_item_price: params[:menu_item_price],
    )
  end
end
