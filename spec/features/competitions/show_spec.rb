require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  it 'lists competition attributes' do
    comp1 = Competition.create(name: 'The Sports Thing', location: 'Somewhere', sport: 'Sportsball')
    comp2 = Competition.create(name: 'Futbol Championship', location: 'Elsewhere', sport: 'Futbol')

    visit competition_path(comp1.id)
    expect(page).to have_content('The Sports Thing')
    expect(page).to have_content('Somewhere')
    expect(page).to have_content('Sportsball')
    expect(page).to_not have_content('Futbol Championship')
    expect(page).to_not have_content('Elsewhere')
    expect(page).to_not have_content('Futbol')

    visit competition_path(comp2.id)
    expect(page).to have_content('Futbol Championship')
    expect(page).to have_content('Elsewhere')
    expect(page).to have_content('Futbol')
    expect(page).to_not have_content('The Sports Thing')
    expect(page).to_not have_content('Somewhere')
    expect(page).to_not have_content('Sportsball')
  end

  it 'lists teams in this competition and their attributes' do
  end

  it 'shows average age of all players in the competition' do
  end
end
