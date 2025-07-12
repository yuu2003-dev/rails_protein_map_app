class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: :guest_sign_in

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
