require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :title => "Title",
        :description => "MyText",
        :image_url => "rails5.png",
        :price => "9.99"
      ),
      Product.create!(
        :title => "Title",
        :description => "MyText",
        :image_url => "rails5.png",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td>h2", :text => "Title".to_s, :count => 2
    assert_select "tr>td>p", :text => "MyText".to_s, :count => 2
    assert_select "tr>td>img", :image_url => "/assets/rails5.png", :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
