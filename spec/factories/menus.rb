FactoryBot.define do
  factory :menu do
    name { "テストメニュー" }
    price { 1000 }
    protein { 30 }
    description { "テスト用メニュー" }
    association :user
    association :shop
  end
end
