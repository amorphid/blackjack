require "player"

describe Player do
  let(:deck)
  let(:player) { Player.new }
  let(:count) { player.hand.count }

  describe "#hand" do
    it "should be 2 cards" do
      expect( count ).to eq( 2 )
    end
  end

  describe "#hit" do
    it "should increase hand count by one" do

    end
  end
end
