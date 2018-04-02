FactoryBot.define do
  factory :product do
    sequence :title do |n| 
    	"Book title #{rand(1000)}"
    end
    description "My Book description"
    image_url "rails5.jpg"
    price "9.99"
  end
end
