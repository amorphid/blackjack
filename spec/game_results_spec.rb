require "blackjack"

describe "Blackjack" do
  describe "Player busts" do
    it "should happen when player_score > 21" do
      player_score = [22, nil]
      dealer_score = [0, nil]
      player_busts = result(player_score, dealer_score)

      expect( player_busts ).to eq(
        "Player: #{player_score[0]}.  Player loses :("
      )
    end
  end

  describe "Dealer busts" do
    it "should happen when dealer_score > 21" do
      player_score = [17, "hard"]
      dealer_score = [25, nil]
      dealer_busts = result(player_score, dealer_score)

      expect(dealer_busts).to eq(
        "Dealer: #{dealer_score[0]}.  Player wins :)"
      )
    end
  end

  describe "Player beats dealer" do
    it "should happen when player score > dealer score" do
      player_score = [21, nil]
      dealer_score = [18, nil]
      player_beats_dealer = result(player_score, dealer_score)

      expect(player_beats_dealer).to eq(
        "Player: #{player_score[0]} > Dealer: #{dealer_score[0]}.  Player wins :)"
      )
    end
  end

  describe "Dealer beats player" do
    it "should happen when dealer_score > player_score" do
      player_score = [18, nil]
      dealer_score = [21, nil]
      dealer_beats_player = result(player_score, dealer_score)

      expect(dealer_beats_player).to eq(
        "Player: #{player_score[0]} < Dealer: #{dealer_score[0]}.  Player loses :("
      )
    end
  end

  describe "Game is a draw" do
    it "should happen when player_score equeals dealer_score" do
      player_score = [19, nil]
      dealer_score = [19, nil]
      game_is_a_draw = result(player_score, dealer_score)

      expect(game_is_a_draw).to eq(
        "Player: #{player_score[0]} = Dealer: #{dealer_score[0]}.  Player draws :P"
      )
    end
  end
end
