# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create!(
  [
  {email: 'a@a', password: '111111'}
  ]
)

users = User.create!(
  [
    {email: 'torao@test.com', name: 'トラオ', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/TRARECO.001_2.jpg"), filename:"TRARECO.001_2.jpg"), introduction: '初めまして、トラオと言います。よろしくお願いします。', date_of_birth: '20000701', sex: 0},
    {email: 'torako@test.com', name: 'トラコ', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/TRARECO.001.jpg"), filename:"TRARECO.001.jpg"), introduction: '初めまして、トラコと言います。よろしくお願いします。', date_of_birth: '19970330', sex: 1},
    {email: 'torami@test.com', name: 'トラミ', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/TRARECO.001_3.jpg"), filename:"TRARECO.001_3.jpg"), introduction: '初めまして、トラミと言います。よろしくお願いします。', date_of_birth: '19950601', sex: 2}
  ]
)

posts = Post.create!(
  [
    {user_id: users[0].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okinawat.jpg"), filename:"okinawat.jpg"), title: '沖縄に行ってきた！', location: 47, date: '20220701', status: true},
    {user_id: users[0].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kagoshimat.jpg"), filename:"kagoshimat.jpg"), title: '鹿児島に行ってきた！', location: 46, date: '20220815', status: true},
    {user_id: users[0].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/miyazakit.jpg"), filename:"miyazakit.jpg"), title: '宮崎に行ってきた！', location: 45, date: '20220930', status: true},
    {user_id: users[1].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hokkaidot.jpg"), filename:"hokkaidot.jpg"), title: 'いざ、夏の北海道へ！', location: 1, date: '20210720', status: true},
    {user_id: users[1].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/aomorit.jpg"), filename:"aomorit.jpg"), title: 'いざ、夏の青森へ！', location: 2, date: '20210820', status: true},
    {user_id: users[1].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/iwatet.jpg"), filename:"iwatet.jpg"), title: 'いざ、秋の岩手へ！', location: 3, date: '20210920', status: true},
    {user_id: users[2].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ishikawat.jpg"), filename:"ishikawat.jpg"), title: '食べ歩きin金沢', location: 17, date: '20210320', status: true},
    {user_id: users[2].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kyotot.jpg"), filename:"kyotot.jpg"), title: '食べ歩きin京都', location: 26, date: '20210504', status: true},
    {user_id: users[2].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/oosakat.jpg"), filename:"oosakat.jpg"), title: '食べ歩きin大阪', location: 27, date: '20220328', status: true}
  ]
)

post_details = PostDetail.create!(
  [
    {post_id: posts[0].id, spot_name: '沖縄1', visit_time: DateTime.new(2022, 7, 1, 10, 30, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okinawa1.jpg"), filename:"okinawa1.jpg")},
    {post_id: posts[0].id, spot_name: '沖縄2', visit_time: DateTime.new(2022, 7, 1, 12, 30, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okinawa2.jpg"), filename:"okinawa2.jpg")},
    {post_id: posts[0].id, spot_name: '沖縄3', visit_time: DateTime.new(2022, 7, 1, 15, 20, 37), impre: '３番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okinawa3.jpg"), filename:"okinawa3.jpg")},
    {post_id: posts[1].id, spot_name: '鹿児島1', visit_time: DateTime.new(2022, 8, 15, 12, 30, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kagoshima1.jpg"), filename:"kagoshima1.jpg")},
    {post_id: posts[1].id, spot_name: '鹿児島2', visit_time: DateTime.new(2022, 8, 15, 14, 30, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kagoshima2.jpg"), filename:"kagoshima2.jpg")},
    {post_id: posts[1].id, spot_name: '鹿児島3', visit_time: DateTime.new(2022, 8, 15, 18, 30, 37), impre: '３番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kagoshima3.jpg"), filename:"kagoshima3.jpg")},
    {post_id: posts[2].id, spot_name: '宮崎1', visit_time: DateTime.new(2022, 9, 30, 13, 10, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/miyazaki1.jpg"), filename:"miyazaki1.jpg")},
    {post_id: posts[2].id, spot_name: '宮崎2', visit_time: DateTime.new(2022, 9, 30, 16, 00, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/miyazaki2.jpg"), filename:"miyazaki2.jpg")},
    {post_id: posts[3].id, spot_name: '北海道1', visit_time: DateTime.new(2021, 7, 20, 10, 30, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hokkaido1.jpg"), filename:"hokkaido1.jpg")},
    {post_id: posts[3].id, spot_name: '北海道2', visit_time: DateTime.new(2021, 7, 20, 14, 30, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hokkaido2.jpg"), filename:"hokkaido2.jpg")},
    {post_id: posts[3].id, spot_name: '北海道3', visit_time: DateTime.new(2021, 7, 20, 17, 00, 37), impre: '３番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hokkaido3.jpg"), filename:"hokkaido3.jpg")},
    {post_id: posts[4].id, spot_name: '青森1', visit_time: DateTime.new(2021, 8, 20, 9, 30, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/aomori1.jpg"), filename:"aomori1.jpg")},
    {post_id: posts[4].id, spot_name: '青森2', visit_time: DateTime.new(2021, 8, 20, 12, 30, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/aomori2.jpg"), filename:"aomori2.jpg")},
    {post_id: posts[4].id, spot_name: '青森3', visit_time: DateTime.new(2021, 8, 20, 15, 00, 37), impre: '３番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/aomori3.jpg"), filename:"aomori3.jpg")},
    {post_id: posts[5].id, spot_name: '岩手1', visit_time: DateTime.new(2021, 9, 20, 9, 30, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/iwate1.jpg"), filename:"iwate1.jpg")},
    {post_id: posts[6].id, spot_name: '金沢1', visit_time: DateTime.new(2021, 3, 20, 12, 30, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ishikawa1.jpg"), filename:"ishikawa1.jpg")},
    {post_id: posts[6].id, spot_name: '金沢2', visit_time: DateTime.new(2021, 3, 20, 18, 30, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ishikawa2.jpg"), filename:"ishikawa2.jpg")},
    {post_id: posts[6].id, spot_name: '金沢3', visit_time: DateTime.new(2021, 3, 21, 11, 00, 37), impre: '３番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ishikawa3.jpg"), filename:"ishikawa3.jpg")},
    {post_id: posts[6].id, spot_name: '金沢4', visit_time: DateTime.new(2021, 3, 21, 14, 30, 37), impre: '4番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ishikawa1.jpg"), filename:"ishikawa1.jpg")},
    {post_id: posts[7].id, spot_name: '京都1', visit_time: DateTime.new(2021, 5, 4, 10, 30, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hokkaido1.jpg"), filename:"hokkaido1.jpg")},
    {post_id: posts[7].id, spot_name: '京都2', visit_time: DateTime.new(2021, 5, 4, 14, 30, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kyoto2.jpg"), filename:"kyoto2.jpg")},
    {post_id: posts[7].id, spot_name: '京都3', visit_time: DateTime.new(2021, 5, 4, 17, 00, 37), impre: '３番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kyoto3.jpg"), filename:"kyoto3.jpg")},
    {post_id: posts[8].id, spot_name: '大阪1', visit_time: DateTime.new(2022, 3, 28, 13, 10, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/oosaka1.jpg"), filename:"oosaka1.jpg")},
    {post_id: posts[8].id, spot_name: '大阪2', visit_time: DateTime.new(2022, 3, 28, 16, 00, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/oosaka2.jpg"), filename:"oosaka2.jpg")}
  ]
)

Review.create!(
  [
    {post_id: posts[0].id, user_id: users[0].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[0].id, user_id: users[2].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'},
    {post_id: posts[1].id, user_id: users[1].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[1].id, user_id: users[2].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'},
    {post_id: posts[2].id, user_id: users[0].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[2].id, user_id: users[1].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'},
    {post_id: posts[3].id, user_id: users[0].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[3].id, user_id: users[2].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'},
    {post_id: posts[4].id, user_id: users[1].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[4].id, user_id: users[2].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'},
    {post_id: posts[5].id, user_id: users[0].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[5].id, user_id: users[1].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'},
    {post_id: posts[6].id, user_id: users[0].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[6].id, user_id: users[2].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'},
    {post_id: posts[7].id, user_id: users[1].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[7].id, user_id: users[2].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'},
    {post_id: posts[8].id, user_id: users[0].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'},
    {post_id: posts[8].id, user_id: users[1].id, title: '細かい説明が書いてあって嬉しい', content: '細かい説明を書いてくれているので自分が行く時も安心です。'}
  ]
)

Comment.create!(
  [
    {post_id: posts[0].id, user_id: users[0].id, detail: '綺麗な写真ですね'},
    {post_id: posts[0].id, user_id: users[1].id, detail: '行ってみたい'},
    {post_id: posts[1].id, user_id: users[2].id, detail: '綺麗な写真ですね'},
    {post_id: posts[1].id, user_id: users[0].id, detail: '最寄りから何分ですか？'},
    {post_id: posts[2].id, user_id: users[1].id, detail: '行ってみたい'},
    {post_id: posts[2].id, user_id: users[2].id, detail: '綺麗な写真ですね'},
    {post_id: posts[3].id, user_id: users[0].id, detail: '最寄りから何分ですか？'},
    {post_id: posts[4].id, user_id: users[2].id, detail: '行ってみたい'},
    {post_id: posts[4].id, user_id: users[0].id, detail: '最寄りから何分ですか？'},
    {post_id: posts[5].id, user_id: users[1].id, detail: '綺麗な写真ですね'},
    {post_id: posts[6].id, user_id: users[0].id, detail: '行ってみたい'},
    {post_id: posts[6].id, user_id: users[0].id, detail: '最寄りから何分ですか？'},
    {post_id: posts[7].id, user_id: users[0].id, detail: '綺麗な写真ですね'},
    {post_id: posts[7].id, user_id: users[0].id, detail: '行ってみたい'},
    {post_id: posts[8].id, user_id: users[0].id, detail: '綺麗な写真ですね'}
  ]
)

Relationship.create!(
  [
    {followed_id: users[0].id, follower_id: users[1].id},
    {followed_id: users[0].id, follower_id: users[2].id},
    {followed_id: users[1].id, follower_id: users[2].id},
    {followed_id: users[2].id, follower_id: users[0].id}
  ]
)
