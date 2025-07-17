# frozen_string_literal: true

class ShopsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_shop, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    if params[:q].present?
      keyword = "%#{params[:q]}%"
      @shops = Shop.where("name ILIKE ? OR address ILIKE ? OR description ILIKE ?", keyword, keyword, keyword)
    else
      @shops = Shop.all
    end

    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        info_window: render_to_string(partial: "shops/info_window", locals: { shop: shop })
      }
    end
  end

  def show; end

  def new
    @shop = current_user.shops.build
  end

  def edit; end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      redirect_to @shop, notice: "店舗が登録されました。"
    else
      flash.now[:alert] = "店舗の登録に失敗しました。"
      render :new
    end
  end

  def update
    if @shop.update(shop_params)
      redirect_to @shop, notice: "店舗情報が更新されました。"
    else
      flash.now[:alert] = "店舗情報の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to mypage_path, notice: "店舗が削除されました。"
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def authorize_user!
    redirect_to shops_path, alert: "この店舗を編集・削除する権限がありません。" unless @shop.user == current_user
  end

  def shop_params
    params.expect(shop: %i[name address description])
  end
end
