require 'rails_helper'

RSpec.describe 'トップページ', type: :system do
  it 'トップページにアクセスできる' do
    visit root_path
    expect(page).to have_content '高タンパク食をシェアしよう！'
  end
end
