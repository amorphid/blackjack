require "playing_card"

describe PlayingCard do
  describe "#show" do
    it "should show '4 of Spades'" do
      card = PlayingCard.new("4", "Spades")

      expect(card.face_up).to eq("4 of Spades")
    end

    it "should show '4 of Spades'" do
      card = PlayingCard.new("Q", "Clubs")

      expect(card.face_up).to eq("Q of Clubs")
    end
  end
end
