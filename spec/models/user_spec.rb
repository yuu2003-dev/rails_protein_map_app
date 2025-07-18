require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '名前・メール・パスワードがあれば有効' do
      user = User.new(name: 'テストユーザー', email: "test_#{SecureRandom.hex(4)}@example.com", password: 'password')
      expect(user).to be_valid
    end

    it '名前がなければ無効' do
      user = User.new(name: nil, email: "test_#{SecureRandom.hex(4)}@example.com", password: 'password')
      expect(user).not_to be_valid
    end

    it 'メールがなければ無効' do
      user = User.new(name: 'テストユーザー', email: nil, password: 'password')
      expect(user).not_to be_valid
    end

    it 'パスワードが短いと無効' do
      user = User.new(name: 'テストユーザー', email: "test_#{SecureRandom.hex(4)}@example.com", password: '123')
      expect(user).not_to be_valid
    end
  end

  describe 'アソシエーション' do
    it 'メニューと関連付けがある' do
      association = User.reflect_on_association(:menus)
      expect(association.macro).to eq :has_many
    end
  end
end
