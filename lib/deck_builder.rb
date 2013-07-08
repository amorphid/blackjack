require_relative "playing_card"

class DeckBuilder
  def initialize
    @deck = []
  end

  def blackjack(number_of_decks = 1)
    ranks.product(suits).each do |rank, suit|
      number_of_decks.times  { @deck<< PlayingCard.new(rank, suit) }
    end

    deck
  end

  def deck
    @deck
  end

  def ranks
    "2".upto("10").to_a + ["J", "Q", "K", "A"]
  end

  def suits
    ["Clubs", "Diamonds", "Hearts", "Spades"]
  end
end
