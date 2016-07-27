class Origin < ActiveRecord::Base
  belongs_to :link
  validates  :content, presence: true, length: { maximum: 140 }
end
