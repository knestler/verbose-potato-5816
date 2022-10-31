require 'rails_helper'

RSpec.describe Customer, type: :feature do
  describe 'customer show page' do
    it 'has customer name' do  
      smash = Customer.create!(name: "Ashley")
      powersurg = Customer.create!(name: "Sergio")

      visit "/customers/#{smash.id}"
      expect(page).to have_content(smash.name)
      
      visit "/customers/#{powersurg.id}"
      expect(page).to have_content(powersurg.name)
    end 

    it 'has a list of its items and their attributes(name, price supermarket)' do 
      smash = Customer.create!(name: "Ashley")
      powersurg = Customer.create!(name: "Sergio")
      kev = Customer.create!(name: "Kevin")
      alex = Customer.create!(name: "Alex")
      
      wf = Supermarket.create!(name:"Whole Foods" , location: "White Plains", id: 1)
      weg = Supermarket.create!(name:"Wegmans" , location: "West Harrison", id: 2)
      
      waffles = Item.create!(name: "Waffles", price: 6, supermarket_id: 1)
      beer = Item.create!(name: "Beer", price: 22, supermarket_id: 1)
      apples = Item.create!(name: "Apples", price: 3, supermarket_id: 2)
      coffee = Item.create!(name: "Coffee" , price: 16, supermarket_id: 2)


      CustomerItem.create!(customer: alex, item: beer)
      CustomerItem.create!(customer: alex, item: coffee)

      CustomerItem.create!(customer: kev, item: apples)
      CustomerItem.create!(customer: kev, item: waffles)

      visit "/customers/#{alex.id}"

      expect(page).to have_content(alex.items)
      expect(page).to have_content(alex.supermarket)

      visit "/customers/#{kev.id}"

      expect(page).to have_content(kev.items)
      expect(page).to have_content(kev.supermarket)
    end
  end
end