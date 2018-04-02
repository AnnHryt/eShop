require 'rails_helper'

RSpec.describe Product, type: :model do

	let(:product) { FactoryBot.build(:product) }
	
	it "has a valid factory" do
		expect(product.save).to be_truthy  
	end

	it "is not valid without a title" do
		product.title = nil
		expect(product).not_to be_valid
		expect(product.errors[:title].any?).to be_truthy
	end

	it "is not valid without a unique title" do
		product.title = "Rails 5 book"
		product.save
		another_product = FactoryBot.build(:product, title: "Rails 5 book")
		expect(another_product).to_not be_valid
		expect(another_product.errors[:title].any?).to be_truthy
		expect(another_product.errors[:title]).to include("has already been taken")
	end

	it "is not valid without a description" do    
		product.description = nil
		expect(product).not_to be_valid
		expect(product.errors[:description].any?).to be_truthy
	end
	
	it "is not valid without a price" do
		product.price = nil
		expect(product).not_to be_valid
		expect(product.errors[:price].any?).to be_truthy
	end

	it "is not valid without an image URL" do
		product.image_url = nil
		expect(product).not_to be_valid
		expect(product.errors[:image_url].any?).to be_truthy
	end

	it "has a price greater than zero" do
		product.price = -1
		expect(product).not_to be_valid
		expect(product.errors[:price]).to include("must be greater than or equal to 0.01")
		product.price = 0
		expect(product).not_to be_valid
		expect(product.errors[:price]).to include("must be greater than or equal to 0.01")
		product.price = 1
		expect(product).to be_valid
	end
	
	it "has valid image URL" do
		ok = %w{ test.gif test.jpg test.png TEST.JPG TEST.Jpg http://a.b.c/x/y/z/fred.gif }
		bad = %w{ test.doc test.gif/more test.gif.more }
		ok.each do |image_url|
			product.image_url = image_url	
			expect(product).to be_valid
		end
		bad.each do |image_url|
			product.image_url = image_url	
			expect(product).to_not be_valid
			expect(product.errors[:image_url].any?).to be_truthy
		end
	end
end
