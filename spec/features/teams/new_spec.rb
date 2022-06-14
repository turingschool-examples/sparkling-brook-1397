require 'rails_helper'

RSpec.describe 'New Team Page' do
  it 'has form to create new team' do
    comp1 = Competition.create(name: 'The Sports Thing', location: 'Somewhere', sport: 'Sportsball')

    visit competition_path(comp1.id)

    expect(page).to have_link('Register New Team')
    click_link 'Register New Team'
    expect(current_path).to eq(new_competition_team_path(comp1.id))

    fill_in 'team[:hometown]', with: 'Saturn'
    fill_in 'team[:nickname]', with: 'Waves'
    click_on 'Submit'

    expect(current_path).to eq(competition_path(comp1.id))
    expect(page).to have_content('Saturn')
    expect(page).to have_content('Waves')
  end
end
