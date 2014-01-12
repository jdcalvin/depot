require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products	
	
	test "product title must be unique" do
		product = Product.new(title: products(:ruby).title,
													description: "yyy",
													price: 1,
													image_url: "fred.gif")

		assert product.invalid?
		assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
	end

	test "product title must be at least 10 characters" do
			product = Product.new(description: "yyy",
													 	price: 20,
													 	image_url: "fred.gif")
			product.title = "hey"
			assert product.invalid?
			assert_equal ['is too short (minimum is 10 characters)'], product.errors[:title]

			product.title = "10chars at least!"
			assert product.valid?
	end

	test "product attributes must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end

	test "product price must be positive" do
		product = Product.new(title:			 "My Book Title",
													description: "yyy",
													image_url:	 "zzz.jpg")

		product.price = -1
		assert product.invalid?
		assert_equal ['must be a positive value'], product.errors[:price]


		product.price = 0
		assert product.invalid?
		assert_equal ["must be a positive value"], product.errors[:price]

		product.price = 1
		assert product.valid?

	end

	def new_product(image_url)
		Product.new(title: "My Book Title",
								description: "yyy",
								price: 1,
								image_url: image_url)
	end

	test "image url" do
		ok = "fred.gif fred.jpg fred.png fred.JPG fred.Jpg http://a.b.c/x/y/z/fred.gif".split
		bad = "fred.doc fred.gif/more fred.gif.more".split
		ok.each do |x|
			assert new_product(x).valid?, "#{x} should be valid"
		end
		bad.each do |x|
			assert new_product(x).invalid?, "#{x} should be invalid"
		end
	end
end
