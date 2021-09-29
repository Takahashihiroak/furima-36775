require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、お名前(全角)とお名前カナ(全角)、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "お名前(全角)が空では登録できない" do
        @user.family_name = ''
        @user.first_name = ''
        @user.valid?
      end
      it "お名前カナ(全角)が空では登録できない" do
        @user.family_name_kana = ''
        @user.first_name_kana = ''
        @user.valid?
      end
      it "生年月日が空では登録できない" do
        @user.birthday = ''
        @user.valid?
      end
    end
  end
end