class PlayingCard
  attr_accessor :rank,
                :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_up
    "#{rank} of #{suit}"
  end
end
