require 'open-uri'

class Link < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :url, format: /\A#{URI.regexp(%w(http https))}\z/
	validates :bunrui, presence: true
	has_many :origin

	def url_exist?(url)

		res = lambda do |url|
			begin
				uri = URI.parse(url)
				uri_path = uri.path.empty? ? '/' : uri.path
				Net::HTTP.start(uri.host, uri.port) { |http| http.get(uri_path) }
			rescue TypeError, SocketError, URI::InvalidURIError
				false
			end
		end
		!url.nil? && !url.empty? && (Net::HTTPSuccess === res.call(url) || Net::HTTPRedirection === res.call(url))
	end

	def getpagetitle

		if url_exist?(:url)

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
end
