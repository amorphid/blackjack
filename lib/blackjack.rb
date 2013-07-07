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
      when "J"   then 10
      when "Q"   then 10
      when "K"   then 10
      else            card[0].to_i
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

def dealer_turn(hand, deck)
  score = score(hand)

  while dealer_hit?(score)
    hand << deck.pop
    score = score(hand)
  end

  hand
end

def player_turn(hands, deck)
  score = score(hands[:player])

  while player_hit?(score)
    puts
    puts "Dealer showing #{hands[:dealer]}."
    puts "Player showing #{hands[:player]}."
    puts
    puts "1) hit or 2) stand?"

    choice = gets.chomp

    case choice
    when "1"
      hands[:player] << deck.pop
      score = score(hands[:player])
    when "2"
      break
    else
      puts "Invalid selection"
    end
  end

  hands
end

def player_hit?(score)
  case
  when score[0] >= 21 then false
  when score[0] <  21 then true
  end
end

def dealer_hit?(score)
  case
  when score[0] < 17          then true
  when score == [17, "soft"]  then true
  when score[0] > 17          then false
  when score == [17, "hard"]  then false
  end
end

def result(player_score, dealer_score)

  player_busts = "Player: #{player_score[0]}.  Player loses :("
  dealer_busts = "Dealer: #{dealer_score[0]}.  Player wins :)"
  player_beats_dealer =
    "Player: #{player_score[0]} > Dealer: #{dealer_score[0]}.  Player wins :)"
  dealer_beats_player =
    "Player: #{player_score[0]} < Dealer: #{dealer_score[0]}.  Player loses :("
  game_is_a_draw =
    "Player: #{player_score[0]} = Dealer: #{dealer_score[0]}.  Player draws :P"

  case
  when player_score[0] >  21              then player_busts
  when dealer_score[0] >  21              then dealer_busts
  when player_score[0] >  dealer_score[0] then player_beats_dealer
  when dealer_score[0] >  player_score[0] then dealer_beats_player
  when player_score[0] == dealer_score[0] then game_is_a_draw
  end
end

def application
  deck = deck_of_52_playing_cards.shuffle

  hands = {
    player: [deck.pop] << deck.pop,
    dealer: [deck.pop]
  }

  hands = player_turn(hands, deck)
  hands[:dealer] = dealer_turn(hands[:dealer], deck)

  puts
  puts "Dealer showing #{hands[:dealer]}."
  puts "Player showing #{hands[:player]}."
  puts

  puts result(
    score(hands[:player]),
    score(hands[:dealer])
  )
end

application
