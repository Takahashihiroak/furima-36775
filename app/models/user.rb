class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/, message: '全角日本語を使用してください' } do
    validates :family_name, presence: true
    validates :first_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :family_name_kana, presence: true
    validates :first_name_kana, presence: true
  end
  validates :birthday, presence: true
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message:'英数字混合を使用してください' } do
 
  end
end
