class Origin < ActiveRecord::Base
  belongs_to :link
	belongs_to :user
  validates  :content, presence: true, length: { maximum: 50 }
end
