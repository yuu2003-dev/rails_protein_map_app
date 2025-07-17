class MenusController < ApplicationController
  # メニューの登録・編集・削除のみ認証が必要
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_shop
  before_action :set_menu, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @menus = @shop.menus
  end

  def show
  end

  def new
    @menu = @shop.menus.build
  end

  def create
    @menu = @shop.menus.build(menu_params)
    @menu.user = current_user
    if @menu.save
      redirect_to shop_menu_path(@shop, @menu), notice: "メニューが登録されました。"
    else
      flash.now[:alert] = "メニューの登録に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to shop_menu_path(@shop, @menu), notice: "メニューが更新されました。"
    else
      flash.now[:alert] = "メニューの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to shop_path(@shop), notice: "メニューが削除されました。"
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_menu
    @menu = @shop.menus.find(params[:id])
  end

  def authorize_user!
    unless @menu.user == current_user
      redirect_to shop_path(@shop), alert: "このメニューを編集・削除する権限がありません。"
    end
  end

  def menu_params
    params.require(:menu).permit(:name, :description, :price, :protein)
  end
end
