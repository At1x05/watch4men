class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader #mount uploader from carriermagic
	validates_presence_of :name, :price, :description
	validates_numericality_of :price
end
