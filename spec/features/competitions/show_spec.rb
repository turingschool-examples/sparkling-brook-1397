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
    comp1 = Competition.create(name: 'The Sports Thing', location: 'Somewhere', sport: 'Sportsball')
    comp2 = Competition.create(name: 'Futbol Championship', location: 'Elsewhere', sport: 'Futbol')

    team1 = Team.create(nickname: 'Orbs', hometown: 'Earth')
    team2 = Team.create(nickname: 'Cubes', hometown: 'Mars')
    team3 = Team.create(nickname: 'Hedrons', hometown: 'Venus')

    CompetitionTeam.create(team: team1, competition: comp1)
    CompetitionTeam.create(team: team2, competition: comp1)
    CompetitionTeam.create(team: team3, competition: comp2)

    visit competition_path(comp1.id)

    expect(page).to have_content('Orbs')
    expect(page).to have_content('Earth')
    expect(page).to have_content('Cubes')
    expect(page).to have_content('Mars')
    expect(page).to_not have_content('Hedrons')
    expect(page).to_not have_content('Venus')
  end

  it 'shows average age of all players in the competition' do
    comp1 = Competition.create(name: 'The Sports Thing', location: 'Somewhere', sport: 'Sportsball')
    comp2 = Competition.create(name: 'Futbol Championship', location: 'Elsewhere', sport: 'Futbol')

    team1 = Team.create(nickname: 'Orbs', hometown: 'Earth')
    team2 = Team.create(nickname: 'Cubes', hometown: 'Mars')
    team3 = Team.create(nickname: 'Hedrons', hometown: 'Venus')

    player1 = team1.players.create(name: 'Aeb', age: 277)
    player2 = team1.players.create(name: 'Beeb', age: 138)
    player3 = team2.players.create(name: 'Cen', age: 90)
    player4 = team2.players.create(name: 'Dyth', age: 83)
    player5 = team3.players.create(name: 'Eno', age: 122)

    CompetitionTeam.create(team: team1, competition: comp1)
    CompetitionTeam.create(team: team2, competition: comp1)
    CompetitionTeam.create(team: team3, competition: comp2)

    visit competition_path(comp1.id)
    expect(page).to have_content('Average Player Age: 142')
  end
end
