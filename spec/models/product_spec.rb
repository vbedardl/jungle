require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it("should create a product") do
      @category = Category.find_or_create_by! name: 'Toys'
      expect { 
        @category.products.create({
        name: 'Red Ball',
        price_cents: '190',
        quantity: 1
      })
      }.to change {Product.count}
    end
    
    it('should validates :name, presence to true') do
      @category = Category.find_or_create_by! name: 'Test'
      expect {
        @category.products.create({
        name: nil,
        price: '190',
        quantity: 1
      })
    }.not_to change {Product.count}
    end

    it('should validates :price, presence to true') do
      @category = Category.find_or_create_by! name: 'Test'
      expect {
        @category.products.create({
        name: 'Blue Ball',
        price: nil,
        quantity: 1
      })
    }.not_to change {Product.count}
    end

    it('should validates :quantity, presence to true') do
      @category = Category.find_or_create_by! name: 'Test'
      expect {
        @category.products.create({
        name: 'Green Ball',
        price: '190',
        quantity: nil
      })
    }.not_to change {Product.count}
    end

    it('should validates :category, presence to true') do
      expect {
        Product.create({
        name: 'Yellow Ball',
        price: '190',
        quantity: 1
      })
    }.not_to change {Product.count}
    end
  end
end
