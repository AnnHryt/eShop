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
  expect(rendered).to have_selector("tr>td>h2", :text => /Book title/), :count => 2
  expect(rendered).to have_selector("tr>td>p", :text => /Book description/), :count => 2
  expect(rendered).to have_selector('img[src*="rails5"]'), :count => 2
  expect(rendered).to have_selector("tr>td", :text => /9.99/), :count => 2
end
end