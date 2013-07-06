require "blackjack"

describe "The hand's score" do
  it "should be  [11, nil] with a single Ace" do
    hand = [["A", "♣"]]

    expect( score(hand) ).to eq( [11, nil] )
  end

  it "should be [10, nil] with a single Jack" do
    hand = [["J", "♠"]]

    expect( score(hand) ).to eq( [10, nil] )
  end

  it "should be [10, nil] with a single Queen" do
    hand = [["Q", "♠"]]

    expect( score(hand) ).to eq( [10, nil] )
  end

  it "should be [10, nil] with a single King" do
    hand = [["K", "♠"]]

    expect( score(hand) ).to eq( [10, nil] )
  end

  it "should be [10, nil] with a single 10" do
    hand = [["10", "♥"]]

    expect( score(hand) ).to eq( [10, nil] )
  end

  it "should be [3, nil] with a single 3" do
    hand = [["3", "♥"]]

    expect( score(hand) ).to eq( [3, nil] )
  end

  it "should be [9, nil] with hand 2 ♠, 7 ♦" do
    hand = [
      ["2", "♠"],
      ["7", "♦"]
    ]

    expect( score(hand) ).to eq( [9, nil] )
  end

  it "should be [17, soft] with hand A ♦, 6 ♦" do
    hand = [
      ["A", "♦"],
      ["6", "♦"]
    ]

    expect( score(hand) ).to eq( [17, "soft"] )
  end

  it "should be [17, hard] with hand A ♦, 3 ♦, 6 ♦, 7 ♦" do
    hand = [
      ["A", "♦"],
      ["3", "♦"],
      ["6", "♦"],
      ["7", "♦"]
    ]

    expect( score(hand) ).to eq( [17, "hard"] )
  end

  it "should be [21, nil] with hand A ♦, 10 ♦" do
    hand = [
      ["A", "♦"],
      ["10", "♦"]
    ]

    expect( score(hand) ).to eq( [21, nil] )
  end

  it "should be [21, nil] with hand A ♦, 4 ♦, 3 ♦, 3 ♦" do
    hand = [
      ["A", "♦"],
      ["4", "♦"],
      ["3", "♦"],
      ["3", "♦"]
    ]

    expect( score(hand) ).to eq( [21, nil] )
  end
end
