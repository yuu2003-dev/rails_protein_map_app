# テストユーザーを作成
test_user = User.find_or_create_by!(email: 'test@example.com') do |user|
  user.password = 'password'
  user.username = 'テストユーザー'
end

puts "✅ テストユーザーを作成しました: #{test_user.email}"

# 店舗データ
shop1 = test_user.shops.find_or_create_by!(
  name: "筋肉食堂",
  address: "六本木",
  latitude: 35.6628,
  longitude: 139.731,
  description: "これはテストデータです"
)

shop2 = test_user.shops.find_or_create_by!(
  name: "すき家",
  address: "渋谷",
  latitude: 35.6595,
  longitude: 139.7005,
  description: "これはテストデータです"
)

puts "✅ 店舗データを作成しました: #{shop1.name}, #{shop2.name}"

# メニューデータ
menu1 = shop1.menus.find_or_create_by!(
  name: "牛赤身肉のハンバーグステーキ 200g",
  protein: 38.7,
  price: 1200,
  user_id: test_user.id,
  description: "これはテストデータです"
)

menu2 = shop2.menus.find_or_create_by!(
  name: "鶏そぼろ丼",
  protein: 30.0,
  price: 550,
  user_id: test_user.id,
  description: "これはテストデータです"
)

menu3 = shop2.menus.find_or_create_by!(
  name: "マグロたたき丼",
  protein: 29.2,
  price: 680,
  user_id: test_user.id,
  description: "これはテストデータです"
)

puts "✅ メニューデータを作成しました: #{menu1.name}, #{menu2.name}, #{menu3.name}"

puts "🌱 シードデータの投入が完了しました！"
