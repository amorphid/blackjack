require "pry"

# m.babby@berkeley.edu

def deck_of_52_playing_cards
  ranks = "2".upto("10").to_a + ["J", "Q", "K", "A"]
  suits = ["\u2663", "\u2666", "\u2665", "\u2660"]
  deck = []

  ranks.each do |rank|
    suits.each do |suit|
      deck << [rank, suit]
    end
  end

  deck
end

def score(hand)
  score = 0

  non_aces = hand.select { |card| card[0] != "A" }
  aces     = hand.select { |card| card[0] == "A" }

  non_aces.each do |card|
    score += (
      case card[0]
      when "J" then 10
      when "Q" then 10
      when "K" then 10
      else card[0].to_i
      end
    )
  end

  if aces.count > 0
    if (score + aces.count > 12)
      score += aces.count
    else
      score += 10 + aces.count
    end
  end

  case
  when score == 17 && aces.count == 1 && hand.count == 2
    [score, "soft"]
  when score == 17
    [score, "hard"]
  else
    [score, nil]
  end
end

def result(player_score, dealer_score)
  player_wins    = "Player wins :)"
  player_loses   = "Player loses :("
  game_is_a_draw = "The game is a draw :P"

  case
  when player_score[0] >  21           then player_loses
  when dealer_score[0] >  21           then player_wins
  when player_score[0] >  dealer_score[0] then player_wins
  when dealer_score[0] >  player_score[0] then player_loses
  when player_score[0] == dealer_score[0] then game_is_a_draw
  end
end

def application
  deck = deck_of_52_playing_cards.shuffle

  hands = {
    player: [deck.pop] << deck.pop,
    dealer: [deck.pop]
  }

  scores = {
    player: score(hand[:player]),
    player: score(hand[:dealer])
  }

  results(player_score, dealer_score)
end
