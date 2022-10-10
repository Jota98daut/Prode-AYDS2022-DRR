require_relative '../models/init'

describe 'Bet' do
  describe 'when there is no player' do
   it 'should not be valid' do
     b = Bet.new(player: nil)
     expect(b.valid?).to eq(false)
   end
  end

  describe 'when there is no match' do
    it 'should not be valid' do
      b = Bet.new(match: nil)
      expect(b.valid?).to eq(false)
    end
  end
end

describe "Bet" do
  let(:teamA) {Team.new(name: "A")}
  let(:teamB) {Team.new(name: "B")}

  describe 'when the stage doesn\'t allow penalties' do
    let(:stage) {Stage.new(penalties: false)}

    describe 'and a winner by penalties was predicted' do
      it 'should not be valid' do
        bet = Bet.new(team: teamA, draw: true)
        expect(bet.valid?).to eq(false)
      end
    end
  end
end

describe "Bet" do
  let(:teamA) {Team.new(name: "A")}
  let(:teamB) {Team.new(name: "B")}

  describe 'when the stage doesn\'t allow penalties and there is a winner' do
    let(:stage) {Stage.new(penalties: false)}
    let(:match) {Match.new(home: teamA, away: teamB, draw: false, winner: teamA, stage: stage)}

    describe 'that was correctly predicted' do
      it 'should count as 1 point' do
        bet = Bet.new(team: teamA, match: match)
        expect(bet.calculate_points()).to eq(1)
      end
    end

    describe 'and the other team was predicted to win' do
      it 'should count as 0' do
        bet = Bet.new(team: teamB, match: match)
        expect(bet.calculate_points()).to eq(0)
      end
    end

    describe 'and a draw was predicted' do
      it 'should count as 0' do
        bet = Bet.new(draw: true, team: nil, match: match)
        expect(bet.calculate_points()).to eq(0)
      end
    end
  end
end

describe "Bet" do
  let(:teamA) {Team.new(name: "A")}
  let(:teamB) {Team.new(name: "B")}
  describe 'when the stage doesn\'t allow penalties and there is no winner' do
    let(:stage) {Stage.new(penalties: false)}
    let(:match) {Match.new(home: teamA, away: teamB, draw: true, winner: nil, stage: stage)}

    describe 'and a draw was predicted' do
      it 'should count as 1' do
        bet = Bet.new(draw: true, match: match)
        expect(bet.calculate_points()).to eq(1)
      end  
    end  
    
    describe 'and a win was predicted' do
      it 'should count as 0' do
        bet = Bet.new(draw: false, team: teamA, match: match)
        expect(bet.calculate_points()).to eq(0)
      end
    end
  end
end

describe "Bet" do
  let(:teamA) {Team.new(name: "A")}
  let(:teamB) {Team.new(name: "B")}
  describe 'when the stage allows penalties' do
    let(:stage) {Stage.new(penalties: true)}
    
    describe 'and no winner was predicted' do
      it 'should not be valid' do
        bet = Bet.new(team: nil)
        expect(bet.valid?).to eq(false)
      end  
    end
  end
end

describe "Bet" do
  let(:teamA) {Team.new(name: "A")}
  let(:teamB) {Team.new(name: "B")}

  describe 'when the stage allows penalties' do
    let(:stage) {Stage.new(penalties: true)}

    describe ', there is a winner by penalties, and penalties were predicted' do
      let(:match) {Match.new(home: teamA, away: teamB, draw: true, winner: teamA, stage: stage)}

      describe 'and the winner was correctly predicted' do
        it 'should count as 2' do
          bet = Bet.new(team: teamA, draw: true, match: match)
          expect(bet.calculate_points()).to eq(2)
        end
      end

      describe 'and the winner wasn\'t correctly predicted' do
        it 'should count as 1' do
          bet = Bet.new(team: teamB, draw: true, match: match)
          expect(bet.calculate_points()).to eq(1)
        end
      end
    end
  end
end

describe "Bet" do
  let(:teamA) {Team.new(name: "A")}
  let(:teamB) {Team.new(name: "B")}

  describe 'when the stage allows penalties' do
    let(:stage) {Stage.new(penalties: true)}

    describe ', there is a winner by penalties, and penalties weren\'t predicted' do
    let(:match) {Match.new(home: teamA, away: teamB, draw: true, winner: teamA, stage: stage)}
    
      describe 'and the winner was correctly predicted' do
        it 'should count as 1' do
          bet = Bet.new(team: teamA, draw: false, match: match)
          expect(bet.calculate_points()).to eq(1)
        end
      end

      describe 'and the winner wasn\'t correctly predicted' do
        it 'should count as 0' do
          bet = Bet.new(team: teamB, draw: false, match: match)
          expect(bet.calculate_points()).to eq(0)
        end
      end
    end
  end
end

describe "Bet" do
  let(:teamA) {Team.new(name: "A")}
  let(:teamB) {Team.new(name: "B")}

  describe 'when the stage allows penalties' do
    let(:stage) {Stage.new(penalties: true)}

    describe ', there is a winner by match' do
      let(:match) {Match.new(home: teamA, away: teamB, draw: false, winner: teamA, stage: stage)}

      describe 'and it was correctly predicted' do
        it 'should count as 1' do
          bet = Bet.new(team: teamA, match: match)
          expect(bet.calculate_points()).to eq(1)
        end 
      end  
      
      describe 'and it wasn\'t correctly predicted' do
        it 'should count as 0' do
          bet = Bet.new(team: teamB, match: match)
          expect(bet.calculate_points()).to eq(0)
        end
      end
    end
  end
end

describe "Bet" do
  describe 'when a bet is submitted' do
    describe 'and it is valid' do
      it 'should add it correctly' do
        player = Player.create(username: 'player', password: '1234')
        team_A = Team.create(name: 'teamA')
        team_B = Team.create(name: 'teamB')
        tournament = Tournament.create(name: 'copita')
        stage = Stage.create(name: 'stageA', penalties: true, tournament: tournament)
        match = Match.new(draw: false, home: team_A, away: team_B, stage: stage)
        expect(match.save).to eq(true)
      end
    end
  end
end
