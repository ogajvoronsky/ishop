require 'rails_helper'
require 'spec_helper'


describe Product do
  describe 'valid' do
		let(:create_product) { Product.create!(name: 'Test', price: 2) }
		it 'Creates product' do
			expect{create_product}.to change{Product.count}.by(1)
		end
  end

	describe 'invalid' do
		let(:create_product) { Product.create(name: 'Test', price: -2) }
		it 'Creates product' do
			expect{create_product}.to change{Product.count}.by(0)
		end
  end

  describe '.less_than_5' do
    before do
			@product = Product.create!(name: 'Test', price: 2)
			@product2 = Product.create!(name: 'Test2', price: 4)
			@product3 = Product.create!(name: 'Test2', price: 5)
    end

    it 'Returns' do
			expect(Product.less_than_5).to eq [@product, @product2 ]
    end
  end
  describe '#description?' do
    let(:product) {Product.create!(name: 'Test', price: 2,
    description: 'Some description')}

    it 'Is true' do
      expect(product.description?).to eq true
    end
  end



end
