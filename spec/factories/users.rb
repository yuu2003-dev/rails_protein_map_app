FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password' }
    username { 'テストユーザー' }
    name { 'テストユーザー' }
  end
end
