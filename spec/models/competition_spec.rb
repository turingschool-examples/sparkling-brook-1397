require 'rails_helper'

RSpec.describe Competition, type: :model do
  it { should have_many :competition_teams }
  it { should have_many(:teams).through(:competition_teams) }

  it 'can calculate the average age of all players' do
    comp1 = Competition.create(name: 'The Sports Thing', location: 'Somewhere', sport: 'Sportsball')

    team1 = Team.create(nickname: 'Orbs', hometown: 'Earth')
    team2 = Team.create(nickname: 'Cubes', hometown: 'Mars')

    player1 = team1.players.create(name: 'Aeb', age: 277)
    player2 = team1.players.create(name: 'Beeb', age: 138)
    player3 = team2.players.create(name: 'Cen', age: 90)
    player4 = team2.players.create(name: 'Dyth', age: 83)

    CompetitionTeam.create(team: team1, competition: comp1)
    CompetitionTeam.create(team: team2, competition: comp1)

    expect(comp1.average_age_of_all_players).to eq(147)
  end
end
