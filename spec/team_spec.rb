# frozen_string_literal: true

require_relative '../models/init'

describe 'Team' do
  describe 'when there is no name' do
    it 'should not be valid' do
      t = Team.new(name: nil)
      expect(t.valid?).to eq(false)
    end
  end
end
