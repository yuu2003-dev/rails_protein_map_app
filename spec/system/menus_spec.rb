require 'rails_helper'

RSpec.describe 'メニュー管理', type: :system do
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop, user: user) }

  before do
    login_as(user, scope: :user)
  end

  it 'メニューを新規登録できる' do
    visit new_shop_menu_path(shop)

    fill_in 'menu_name', with: 'テストメニュー'
    fill_in 'menu_price', with: 1000
    fill_in 'menu_protein', with: 30
    fill_in 'menu_description', with: 'テスト用の説明'
    click_button '登録する'

    expect(page).to have_content 'テストメニュー'
  end

  it 'メニューを編集できる' do
    menu = create(:menu, shop: shop, user: user, name: '古いメニュー名')

    visit edit_shop_menu_path(shop, menu)

    fill_in 'menu_name', with: '新しいメニュー名'
    click_button '更新する'

    expect(page).to have_content '新しいメニュー名'
  end
end
