require "card"
require "rspec"

describe Card do 
  subject(:card) {Card.new(:D, 13)}

  describe("#initialize") do
    it("returns suit") do
      expect(card.symbol).to eq(:D)
    end
    it("return value") do 
      expect(card.value).to be(13)
    end


  end

  describe("#get_color") do
    it("return red for Diamonds") do
      expect(card.color).to eq(:red)
    end
  end

end