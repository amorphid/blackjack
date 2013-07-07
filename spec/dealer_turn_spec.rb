require "blackjack"

describe "The Dealer" do
  it "should hit on 10" do
    dealer_score = 10

    expect( dealer_hit?(dealer_score) ).to eq(true)
  end

  it "should hit on a soft 17" do
    dealer_score = [17, "soft"]

    expect( dealer_hit?(dealer_score) ).to eq(true)
  end

  it "should NOT hit on hard 17" do
    dealer_score = [17, "hard"]

    expect( dealer_hit?(dealer_score) ).to eq(false)
  end

  it "should NOT hit when score > 17" do
    dealer_score = [21, nil]

    expect( dealer_hit?(dealer_score) ).to eq(false)
  end
end
