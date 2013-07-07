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
