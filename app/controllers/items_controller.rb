class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  # end
  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :delivery_fee_id, :delivery_day_id, :prefecture_id, :name, :text,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
