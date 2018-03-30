require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:valid_attributes) {{ title: "Book title #{rand(1000)}", description: 'Book description', image_url: 'test.jpg', price: '9.99' }}

  let(:invalid_attributes) {{ title: '', description: '', image_url: 'test.test', price: '' }}

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :show, params: {id: product.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :edit, params: {id: product.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: {product: valid_attributes}, session: valid_session
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, params: {product: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {product: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{ title: 'New Book title #{rand(1000)}', description: 'New Book description', image_url: 'new_test.jpg', price: '10.99' }}

      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: new_attributes}, session: valid_session
        product.reload
        expect(response).to redirect_to(product)
        expect(controller.notice).to eq('Product was successfully updated.')
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: valid_attributes}, session: valid_session
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, params: {id: product.to_param}, session: valid_session
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete :destroy, params: {id: product.to_param}, session: valid_session
      expect(response).to redirect_to(products_url)
    end
  end

end
