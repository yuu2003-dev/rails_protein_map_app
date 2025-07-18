FactoryBot.define do
  factory :shop do
    association :user
    name { "テストショップ" }
    address { "東京都新宿区テスト1-1-1" }
    latitude { 35.6895 }
    longitude { 139.6917 }
    description { "これはテスト用のショップです" }
  end
end
