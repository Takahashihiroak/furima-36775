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

  validates :category, presence: true
  validates :condition, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_day, presence: true
  validates :prefecture, presence: true

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  validates :price, numericality: true

  validates :category_id, :condition_id, :delivery_fee_id, :delivery_day_id, :prefecture_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
