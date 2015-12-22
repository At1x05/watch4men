class StaticPage < ActiveRecord::Base
	validates :header, presence: true, length: {minimum: 10, message: "Długość nagłówka nie może być krótsza, niż 10 znaków"}
	validates :sub_header, presence: true, length: {minimum: 10}
	validates :short_description, presence: true, length: {minimum: 10}
	validates :box_one, presence: true, length: {minimum: 10}
	validates :box_two, presence: true, length: {minimum: 10}
	validates :cto_button, presence: true, length: {minimum: 3}
end
