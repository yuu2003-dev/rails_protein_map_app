# frozen_string_literal: true

class Shop < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy
  geocoded_by :address
  has_many :favorited_users, through: :favorites, source: :user

  validates :name, presence: true
  validates :address, presence: true
  after_validation :geocode, if: :address_changed?
end
