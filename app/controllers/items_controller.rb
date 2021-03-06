class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_action, only: [:show, :edit, :update, :destroy]
  before_action :set_confirmation, only: [:edit, :destroy, :update]
  before_action :sold_out,only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :delivery_fee_id, :delivery_day_id, :prefecture_id, :name, :text,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_action
    @item = Item.find(params[:id])
  end

  def set_confirmation
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end
end
