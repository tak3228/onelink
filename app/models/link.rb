require 'open-uri'

class Link < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :url, presence: true, length: { maximum: 140 }
  validates :bunrui, presence: true
  has_many   :origin


  def getpagetitle

    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)
    
    # タイトルを取り出す
    doc.title
  end

end