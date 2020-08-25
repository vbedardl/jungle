require 'rails_helper'

# RSpec.feature "AddToCarts", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

RSpec.feature "Visitor can add to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
  
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They navigate to product detail page by clicking on a product" do
    # ACT
    visit root_path

    # DEBUG
    first('button').click
    
    #VERIFY
    expect(page).to have_text 'My Cart (1)'

  end

end