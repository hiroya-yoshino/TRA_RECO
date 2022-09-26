class Post < ApplicationRecord
  belongs_to :user
  has_many :post_details, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum location: {
    hokkaidou:1,aomoriken:2,iwateken:3,miyagiken:4,akitaken:5,yamagataken:6,fukusimaken:7,
    ibarakiken:8,totigiken:9,gunmaken:10,saitamaken:11,tibaken:12,toukyouto:13,kanagawaken:14,
    niigataken:15,toyamaken:16,isikawaken:17,fukuiken:18,yamanasiken:19,naganoken:20,
    gihuken:21,sizuokaken:22,aichiken:23,mieken:24,
    sigaken:25,kyoutohu:26,oosakahu:27,hyougoken:28,naraken:29,wakayamaken:30,
    tottoriken:31,simaneken:32,okayamaken:33,hirosimaken:34,yamagutiken:35,
    tokusimaken:36,kagawaken:37,ehimeken:38,koutiken:39,
    fukuokaken:40,sagaken:41,nagasakiken:42,kumamotoken:43,ooitaken:44,miyazakiken:45,kagosimaken:46,okinawaken:47
  }

  has_one_attached :image

  def date_display
    date.strip[0..3] + '.' + date.strip[4..5] + '.' + date.strip[6..7]
  end

  def self.search(keyword)
    where(["title like?", "%#{keyword}%"])
  end

  def self.search_place(place)
    where(location: "#{place}")
  end
end
