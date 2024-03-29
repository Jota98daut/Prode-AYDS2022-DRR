# frozen_string_literal: true

require_relative '../models/init'

describe 'Match' do
  describe 'when there is no home' do
    it 'should not be valid' do
      m = Match.new(home: nil)
      expect(m.valid?).to eq(false)
    end
  end

  describe 'when there is no away' do
    it 'should not be valid' do
      m = Match.new(away: nil)
      expect(m.valid?).to eq(false)
    end
  end

  describe 'when there is no stage' do
    it 'should not be valid' do
      m = Match.new(stage: nil)
      expect(m.valid?).to eq(false)
    end
  end

  describe 'when the stage allows penalties and there is no winner' do
    it 'should not be valid' do
      s = Stage.new(penalties: true)
      m = Match.new(stage: s, winner: nil)
      expect(m.valid?).to eq(false)
    end
  end
end
