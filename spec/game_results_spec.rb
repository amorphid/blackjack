require "blackjack"
require "pry"

describe "Blackjack" do

  let(:player_wins) { "Player wins :)" }
  let(:player_loses) { "Player loses :(" }

  describe "Player busts" do
    it "should happen when player_score > 21" do
      player_busts = result( [22, nil], [0, nil] )

      expect(player_busts).to eq(player_loses)
    end
  end

  describe "Dealer busts" do
    it "should happen when dealer_score > 21" do
      dealer_busts = result( [17, "hard"], [25, nil] )

      expect(dealer_busts).to eq(player_wins)
    end
  end

  describe "Player beats dealer" do
    it "should happen when player score > dealer score" do
      player_beats_dealer = result( [21, nil], [18, nil] )

      expect(player_beats_dealer).to eq(player_wins)
    end
  end

  describe "Dealer beats player" do
    it "should happen when dealer_score > player_score" do
      dealer_beats_player = result( [18, nil], [21, nil] )

      expect(dealer_beats_player).to eq(player_loses)
    end
  end

  describe "Game is a draw" do
    it "should happen when player_score equeals dealer_score" do
      game_is_a_draw = result( [19, nil], [19, nil] )

      expect(game_is_a_draw).to eq("The game is a draw :P")
    end
  end
end
