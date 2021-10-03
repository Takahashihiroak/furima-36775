class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :delivery_fee_id, :delivery_day_id, :prefecture_id, :name, :text, :price, :image).merge(user_id: current_user.id)
  end
end
