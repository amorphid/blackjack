require "deck_builder"

describe DeckBuilder do
  let(:deck_builder) { DeckBuilder.new }

  describe "#deck" do
    it "should be an empty Array" do
      expect( deck_builder.deck ).to eq( [] )
    end
  end

  describe "#blackjack" do
    let(:one_deck) { deck_builder.blackjack }
    let(:two_decks) { deck_builder.blackjack(2) }

    it "should contain 52 unique elements" do
      fifty_two_unique_cards = one_deck.uniq.count

      expect( fifty_two_unique_cards ).to eq( 52 )
    end

    it "should contain 52 PlayingCard objects" do
      deck = one_deck
      count = 0

      0.upto(51).each { |i| count += 1 if deck[i].is_a? PlayingCard }

      expect( count ).to eq( 52 )
    end

    it "should contain 2 decks cards and 104 playing cards" do
      two_deck_count = two_decks.count

      expect( two_deck_count ).to eq ( 104 )
    end
  end
end

