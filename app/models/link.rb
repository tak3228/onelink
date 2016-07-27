class Link < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :url, presence: true, length: { maximum: 140 }
  validates :bunrui, presence: true
  has_many   :origin
end
