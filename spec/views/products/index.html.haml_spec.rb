require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :title => "Book title 1",
        :description => "Book description",
        :image_url => "rails5.png",
        :price => "9.99"
      ),
      Product.create!(
        :title => "Book title 2",
        :description => "Book description",
        :image_url => "rails5.png",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td>h2", :text => "Book title 1".to_s, :count => 1
    assert_select "tr>td>h2", :text => "Book title 2".to_s, :count => 1
    assert_select "tr>td>p", :text => "Book description".to_s, :count => 2
    assert_select "tr>td>img", :image_url => "/assets/rails5.png", :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
