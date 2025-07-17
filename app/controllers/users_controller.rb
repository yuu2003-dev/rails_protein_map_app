# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def mypage
    @shops = @user.shops.includes(:menus)
    @favorite_shops = @user.favorite_shops.includes(:menus, :user)
  end

  def edit; end

  def update
    if update_user
      redirect_to mypage_path, notice: "プロフィールを更新しました"
    else
      flash.now[:alert] = "プロフィール更新に失敗しました"
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    permitted = %i[username email]
    permitted += %i[password password_confirmation] if params[:user][:password].present?
    params.require(:user).permit(permitted)
  end

  def update_user
    if params[:user][:password].blank?
      @user.update_without_password(user_params)
    else
      @user.update(user_params)
    end
  end
end
