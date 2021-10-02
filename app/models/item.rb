class Item < ApplicationRecord
  belongs_to :user 
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :prefecture

  validates :category, :condition, :delivery_fee, :delivery_day, :prefecture, :name, :price, :text, presence: true

  validates :category_id, :condition_id, :delivery_fee_id, :delivery_day_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

end
