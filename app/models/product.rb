class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader #mount uploader from carriermagic
	validates :name, presence: {message: "Nazwa produktu nie może byc pusta" }
	validates :description, presence: { message: "Opis produktu nie może byc pusty"}
	validates :price, presence: {message: "Cena produktu nie może byc pusta"}
	validates :name, presence:{ message: "Długi opis produktu nie może byc pusty"}
	validates :mark, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 10, message: "Ocena musi znajdować się w przedziale od 1 do 10."}
end
