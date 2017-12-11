require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.new(name: 'Test')
    end

    it 'should validate the presence of name' do
      @product = Product.create(
        name: nil,
        price: 30,
        quantity: 60,
        category: @category
      )
      expect(@product.errors.full_messages).to include("Name must be given please")
    end

    it 'should validate the presence of price' do
      @product = Product.create(
        name: 'Test',
        price: nil,
        quantity: 60,
        category: @category
      )
      expect(@product.errors.full_messages).to include("Price must be given please")
    end

    it 'should validate the presence of quantity' do
      @product = Product.create(
        name: 'Test',
        price: 30,
        quantity: nil,
        category: @category
      )
      expect(@product.errors.full_messages).to include("Quantity must be given please")
    end

    it 'should validate the presence of category' do
      @product = Product.create(
        name: 'Test',
        price: 30,
        quantity: 60,
        category: nil
      )
      expect(@product.errors.full_messages).to include("Category must be given please")
    end

    # it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:price) }
    # it { should validate_presence_of(:quantity) }
    # it { should validate_presence_of(:category) }
  end
end
