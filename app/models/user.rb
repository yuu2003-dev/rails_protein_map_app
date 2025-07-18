class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :menus, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_shops, through: :favorites, source: :shop
  has_many :shops, dependent: :destroy

  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲストさん"
    end
  end

  # ゲストかどうか判定
  def guest?
    email == "guest@example.com"
  end
end
