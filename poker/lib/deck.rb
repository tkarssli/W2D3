require_relative "card"
class Deck
 
  def initialize
    @cards = build_deck
  end

  def build_deck 
    suits = [:D, :H, :S, :C]
    result = []
    (1..13).each do |value|
      suits.each do |suit|
        result.push(Card.new(suit, value))
      end
    end
    result.shuffle!
  end

  def take_card
    cards.pop
  end

  def empty?
    cards.empty?
  end
 

  private 
  attr_accessor :cards
end