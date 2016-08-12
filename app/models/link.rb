require 'open-uri'

class Link < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :url, presence: true, format: /\A#{URI.regexp(%w(http https))}\z/
  validates :bunrui, presence: true
	validates :title, presence: true
  has_many :origin

  def get_page_title
    charset = 'utf-8'
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
