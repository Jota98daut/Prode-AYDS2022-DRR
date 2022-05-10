require_relative '../models/bet'

describe 'Bet' do
  describe 'when there is no player' do
    it 'should not be valid' do
      b = Bet.new(player: nil)
      expect(b.valid?).to eq(false)
    end
  end
end

