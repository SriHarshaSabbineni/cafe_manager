class MenuItemsController < ApplicationController
  def index
  end

  def create
    new_menu_item = MenuItem.new(
      name: params[:name],
      price: params[:price],
      menu_id: params[:menu_id],
    )
    if new_menu_item.save
      redirect_to menu_items_path
    else
      flash[:error] = new_menu_item.errors.full_messages.join(", ")
      redirect_to menu_items_path
    end
  end

  def destroy
    id = params[:id]
    item = MenuItem.find(id)
    item.destroy
    redirect_to menu_items_path
  end
end
