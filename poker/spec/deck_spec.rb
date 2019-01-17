require 'rspec'
require 'deck'

describe Deck do 
  # let(:card) {double("card", suit: :D, value: 13)}
  subject(:deck) {Deck.new}

  describe("#build_deck") do

    it("returns 52 cards") do 
      expect(deck.build_deck.length).to be(52)
    end
    it("returns an array with unique elements") do  
      cards = deck.build_deck
      uniques = cards.uniq { |card| [card.value,card.symbol, card.color]}
      expect(cards.length == uniques.length).to be true
    end
  end

  describe("#take_card") do
    it("return cards") do 
      expect(deck.take_card).to be_kind_of(Card)
    end
  end

  describe("#empty?") do 
    it("deck is empty") do 
      52.times{deck.take_card}
      expect(deck.empty?).to be true
    end
  end

  

end