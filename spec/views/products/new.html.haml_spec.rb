require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :title => "Book title",
      :description => "Book description",
      :image_url => "rails5.png",
      :price => "9.99"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[image_url]"

      assert_select "input[name=?]", "product[price]"
    end
  end
end
