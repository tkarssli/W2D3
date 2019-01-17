class Card
  attr_reader :symbol, :value, :color
  def initialize(symbol, value)
    @symbol, @value  = symbol, value
    @color = get_color
  end

  def get_color
    case symbol
    when :D, :H
      :red
    when :S, :C
      :black
    end
  end


end
