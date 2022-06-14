require 'rails_helper'

RSpec.describe 'Competition Index Page' do
  it 'lists all competions' do
    comp1 = Competition.create(name: 'The Sports Thing', location: 'Somewhere', sport: 'Sportsball')
    comp2 = Competition.create(name: 'Futbol Championship', location: 'Elsewhere', sport: 'Futbol')

    visit '/competitions'
    expect(page).to have_content('The Sports Thing')
    expect(page).to have_content('Futbol Championship')
  end

  it 'competition names link to their show pages' do
    comp1 = Competition.create(name: 'The Sports Thing', location: 'Somewhere', sport: 'Sportsball')
    comp2 = Competition.create(name: 'Futbol Championship', location: 'Elsewhere', sport: 'Futbol')

    visit '/competitions'

    click_link 'The Sports Thing'
    expect(current_path).to eq("/competitions/#{comp1.id}")
  end
end
