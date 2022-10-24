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
    {email: 'torao@email.com', name: 'トラオ', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/TRARECO.001_2.jpg"), filename:"TRARECO.001_2.jpg"), introduction: '初めまして、トラオと言います。よろしくお願いします。', date_of_birth: '20000701', sex: 0},
    {email: 'torako@email.com', name: 'トラコ', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/TRARECO.001.jpg"), filename:"TRARECO.001.jpg"), introduction: '初めまして、トラオと言います。よろしくお願いします。', date_of_birth: '20000701', sex: 0}
    ]
)

posts = Post.create!(
  [
    {user_id: users[0].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okinawat.jpg"), filename:"okinawat.jpg"), title: '沖縄に行ってきた！', location: 47, date: '20220701', status: true},
    {user_id: users[0].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kagoshimat.jpg"), filename:"kagoshimat.jpg"), title: '鹿児島に行ってきた！', location: 46, date: '20220815', status: true},
    {user_id: users[0].id, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/miyazakit.jpg"), filename:"miyazakit.jpg"), title: '宮崎に行ってきた！', location: 45, date: '20220930', status: true}
  ]
)

post_details = PostDetail.create!(
  [
    {post_id: posts[0].id, spot_name: '沖縄1', visit_time: DateTime.new(2022, 7, 1, 10, 30, 37), impre: '一番行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okinawa1.jpg"), filename:"okinawa1.jpg")},
    {post_id: posts[0].id, spot_name: '沖縄2', visit_time: DateTime.new(2022, 7, 1, 12, 30, 37), impre: '二番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okinawa2.jpg"), filename:"okinawa2.jpg")},
    {post_id: posts[0].id, spot_name: '沖縄3', visit_time: DateTime.new(2022, 7, 1, 15, 20, 37), impre: '３番目に行ってみたかったところです。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okinawa3.jpg"), filename:"okinawa3.jpg")}
    ]
)

Review.create!(
  [
    {post_id: posts[0].id, user_id: users[0].id, title: '写真が綺麗でみやすい', content: 'どんなどういう場所なのか一目でわかる写真を使っていていいと思いました。'}
  ]
)

Comment.create!(
  [
    {post_id: posts[0].id, user_id: users[0].id, detail: '綺麗な写真ですね'}
  ]
)

# Relationship.create!(
#   [
#     {followed_id: users[0].id, follower_id: users[1].id}
#   ]
# )
