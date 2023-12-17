# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline


admin = Admin.find_or_initialize_by(
  username: ENV['ADMIN_USERNAME'],
  email: ENV['ADMIN_EMAIL'],
)

if admin.new_record?
  admin.password = ENV['ADMIN_PASSWORD']
  admin.save!
end

test = User.find_or_initialize_by(
  username: "testuser",
  email: "test@test",
)
if test.new_record?
  test.password = "test1234"
  test.save!
end

test_user = User.find_by(username: "testuser")

10.times do |n|
  username = "sample#{ n + 1 }"
  email = "sample#{ n + 1 }@sample.com"
  password = "sample1234"

  user = User.find_or_initialize_by(username: username, email: email)

  if user.new_record?
    user.password = password
    user.save!
  end
end


5.times do |n|
  post = test_user.posts.find_or_initialize_by(
    title: "テスト投稿 #{n + 1}",
    body: "テスト投稿の本文 #{n + 1}"
  )

  if post.new_record?
    post.post_image.attach(
      io: File.open(Rails.root.join("app/assets/images/seeds/sample-post.png")),
      filename: "sample-post#{n + 1}.png",
      content_type: 'image/png'
    )
    post.save!
  end
end

5.times do |n|
  test_user.items.find_or_create_by(
    name: "サンプルアイテム#{n + 1}",
    description: "サンプルアイテムの説明欄です#{n + 1}",
    product_link: "http://sample.com/sample_item_link#{n + 1}"
  )
end

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
  Breed.find_or_create_by(name: breed_name)
end


cat1 = test_user.cats.find_or_create_by(
  name: "こた",
  introduction: "いつも甘えん坊のあれくれ者",
  sex: "male",
  date_of_birth: Date.new(2023, 4, 16),
  breed: Breed.find_by(name: "ロシアンブルー"),
)
if cat1.new_record?
  cat1.cat_image.attach(
    io: File.open(Rails.root.join("app/assets/images/seeds/kota.jpg")),
    filename: 'kota.jpg',
    content_type: 'image/jpeg'
  )
end

cat2 = test_user.cats.find_or_create_by(
  name: "だん",
  introduction: "人見知りのだんきちさん",
  sex: "male",
  date_of_birth: Date.new(2016, 5, 25),
  breed: Breed.find_by(name: "雑種"),
)
if cat2.new_record?
  cat2.cat_image.attach(
    io: File.open(Rails.root.join("app/assets/images/seeds/dan.jpg")),
    filename: 'dan.jpg',
    content_type: 'image/jpeg'
  )
end

cat3 = test_user.cats.find_or_create_by(
  name: "れお",
  introduction: "保護猫さん",
  sex: "male",
  breed: Breed.find_by(name: "雑種"),
)
if cat3.new_record?
  cat3.cat_image.attach(
    io: File.open(Rails.root.join("app/assets/images/seeds/leo.jpg")),
    filename: 'leo.jpg',
    content_type: 'image/jpeg'
  )
end

cat4 = test_user.cats.find_or_create_by(
  name: "そう",
  introduction: "保護猫さん",
  sex: "male",
  breed: Breed.find_by(name: "雑種"),
)
if cat4.new_record?
  cat4.cat_image.attach(
    io: File.open(Rails.root.join("app/assets/images/seeds/sou.jpg")),
    filename: 'sou.jpg',
    content_type: 'image/jpeg'
  )
end