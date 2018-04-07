require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
      :title => "Book title",
      :description => "Book description",
      :image_url => "rails5.png",
      :price => "9.99"
      ))
  end

  it "renders product" do
    render
    expect(rendered).to match(/Book title/)
    expect(rendered).to match(/Book description/)
    expect(rendered).to match(/rails5.png/)
    expect(rendered).to match(/9.99/)
  end
end
