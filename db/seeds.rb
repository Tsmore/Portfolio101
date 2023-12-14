# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.find_or_initialize_by(
  username: ENV['ADMIN_USERNAME'],
  email: ENV['ADMIN_EMAIL'],
)

if admin.new_record?
  admin.password = ENV['ADMIN_PASSWORD']
  admin.save!
end

5.times do |n|
  username = "sample#{ n + 1 }"
  email = "sample#{ n + 1 }@sample.com"
  password = "sample1234"

  user = User.find_or_initialize_by(username: username, email: email)

  if user.new_record?
    user.password = password
    user.save!
  end
end

# 一般的な猫の品種
# db/seeds.rb

# 猫の品種のシードデータ
breeds = [
  "アビシニアン", "アメリカンカール", "アメリカンショートヘア", "アメリカンボブテイル",
  "アメリカンワイヤーヘア", "エキゾチックショートヘア", "オシキャット", "オリエンタルショートヘア",
  "カナディアンスフィンクス", "キムリック", "キンカルー", "クリルアイランドボブテイル",
  "ケルンレクス", "サイベリアン", "サバンナキャット", "シャム猫", "シャルトリュー",
  "シャンチィリー/ティファニー", "シンガプーラ", "スコティッシュフォールド", "スフィンクス",
  "セルカークレックス", "チャウシー", "チンチラ", "ツルキッシュアンゴラ",
  "ツルキッシュバン", "デボンレックス", "トンキニーズ", "ナポレオン",
  "ニーベルング", "ノルウェージャンフォレストキャット", "バーマン", "バーミーズ",
  "バリニーズ", "ピーターボールド", "ヒマラヤン", "ブリティッシュショートヘア",
  "ブリティッシュロングヘア", "ベンガル", "ペルシャ", "ボンベイ",
  "マンクス", "マンチカン", "メインクーン", "ヨーロピアンショートヘア",
  "ラガマフィン", "ラグドール", "ラパーマ", "ロシアンブルー",
  "リンクスポイント", "雑種"
]

breeds.each do |breed_name|
  Breed.find_or_create_by!(name: breed_name)
end
