require 'rails_helper'
require 'spec_helper'

describe ProductsController do
 describe '#index' do
   before do
     get :index
   end
   it 'Returns OK' do
     expect(response).to be_ok
   end
 end

  describe '#create' do
    let(:create) do
      post :create, name: 'Prod2', description: 'Prod2 descr',
           price: 12
    end

    it 'Creates product' do
      expect{create}.to change{Product.count}.by(1)
      expect(Product.last.name).to eq 'Prod2'
    end
  end

end