require_relative '../models/init'

describe 'ChampionBet' do
  describe 'when there is no player' do
   it 'should not be valid' do
     cb = ChampionBet.new(player: nil)
     expect(cb.valid?).to eq(false)
   end
  end

  describe 'when there is no team' do
    it 'should not be valid' do
      cb = ChampionBet.new(team: nil)
      expect(cb.valid?).to eq(false)
    end
  end


  describe 'when there is no tournament' do
    it 'should not be valid' do
      cb = ChampionBet.new(tournament: nil)
      expect(cb.valid?).to eq(false)
    end
  end
  
end