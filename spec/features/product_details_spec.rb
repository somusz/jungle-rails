require 'rails_helper'

RSpec.feature "Visitor navigates to products page", type: :feature, js: true do
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
    @product = Product.first
  end

  scenario "they can navigate to the product details page" do
    visit root_path

    click_on @product.name

    visit '/products/1'

    save_screenshot

    expect(page).to have_css 'article.product-detail'

  end
end
