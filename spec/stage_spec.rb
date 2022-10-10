# frozen_string_literal: true

require_relative '../models/init'

describe 'Stage' do
  describe 'when there is no tournament' do
    it 'should not be valid' do
      s = Stage.new(tournament: nil)
      expect(s.valid?).to eq(false)
    end
  end
end
