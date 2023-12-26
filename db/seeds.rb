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
  email: "test@test.com",
)
if test.new_record?
  test.password = "test1234"
  test.save!
end

test_user = User.find_by(username: "testuser")

30.times do |n|
  username = "user#{ n + 1 }"
  email = "user#{ n + 1 }@sample.com"
  password = "user1234"

  user = User.find_or_initialize_by(username: username)

  if user.new_record?
    user.email = email
    user.password = password
    user.save!
  end
end

# 20.times do |n|
#   test_user.items.find_or_create_by(
#     name: "サンプルアイテム#{n + 1}",
#     description: "サンプルアイテムの説明欄です。",
#     product_link: "http://sampleitem.com/sample_item_link#{n + 1}"
#   )
# end

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
  "リンクスポイント", "雑種", "ミックス"
]

breeds.each do |breed_name|
  Breed.find_or_create_by(name: breed_name)
end

# 5.times do |n|
#   post = test_user.posts.find_or_initialize_by(
#     title: "テスト投稿 #{n + 1}",
#     body: "テスト投稿の本文 #{n + 1}"
#   )

#   if post.new_record?
#     post.post_image.attach(
#       io: File.open(Rails.root.join("app/assets/images/seeds/sample-post.jpg")),
#       filename: "sample-post#{n + 1}.jpg",
#       content_type: 'image/jpeg'
#     )
#     post.save!
#   end
# end

# 5.times do |n|

#   user = User.find_by(username: "sample#{n + 1}")

#   5.times do |i|
#     post = user.posts.find_or_initialize_by(
#       title: "サンプルユーザー#{n + 1}のテスト投稿 #{i + 1}",
#       body: "サンプルユーザー#{n + 1}のテスト投稿の本文 #{i + 1}"
#     )

#     if post.new_record?
#       post.post_image.attach(
#         io: File.open(Rails.root.join("app/assets/images/seeds/sample-post.jpg")),
#         filename: "user#{n + 1}-post#{i + 1}.jpg",
#         content_type: 'image/jpeg'
#       )
#       post.save!
#     end
#   end
# end


