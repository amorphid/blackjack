require "blackjack"

describe "The Player" do
  it "should be able to hit on 20" do
    score = [20,nil]

    expect( player_hit?(score) ).to eq(true)
  end

  it "should not be able to hit on 21" do
    score = [21,nil]

    expect( player_hit?(score) ).to eq(false)
  end
end

dealer = Dealer.new
players = cre

  @dealer = Dealer.new




class Game
  def initialize
    @@deck = DeckBuilder.new.blackjack
    # @players = Create.new.players
    @dealer = Dealer.new
  end

  def deck
    @deck

  def play
  end
end

class Create
  def initialize
  end
end

class Dealer < Player
end

class Player
  def initialize
    2.times { hit }
  end

  def hand
    @hand
  end

  def hit
    @hand << deck.pop
  end
end

class Deck
  def initialize
    @cards = 1.upto(52).to_a
  end

  def cards
    @cards
  end
end

class Game
  def initialize
    @deck = Deck.new.cards
  end


  def hit
  end
end

