class Page < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 4}, uniqueness: true
	validates :content, presence: true

end
