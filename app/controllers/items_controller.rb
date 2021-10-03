class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_action, only: [:create, :show, :edit, :update]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def update
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

  def set_action
    @item = Item.find(params[:id])
  end
end
