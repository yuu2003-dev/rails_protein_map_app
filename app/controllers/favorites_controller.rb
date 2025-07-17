# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    shop = Shop.find(params[:id])
    current_user.favorites.create(shop: shop)
    redirect_to shop, notice: "お気に入りに追加しました"
  end

  def destroy
    shop = Shop.find(params[:id])
    current_user.favorites.find_by(shop: shop)&.destroy
    redirect_to shop, notice: "お気に入りを解除しました"
  end
end
