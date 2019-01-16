class Array
  def my_uniq
    res = []
    self.each do |el|
      res << el unless res.include?(el)
    end
    res
  end

  def two_sum
    res =[]
    (0...self.length).each do |i|
      (i+1...self.length).each do |j|
        res << [i, j] if self[i] + self[j] == 0
      end
    end
    res
  end

  def my_transpose
    return self if self.length == 0 
    raise ArgumentError unless self[0].is_a?(Array)
    res = []
    (0...self[0].length).each do |col|
      col_arr = []
      (0...self.length).each do |row|
        col_arr.push(self[row][col])
      end
      res.push(col_arr)
    end
    res
  end
end

def stock_picker(prices)
  raise ArgumentError unless prices.is_a? Array
  return nil if prices.length < 2
  pairs = get_pairs(prices)
  arr = pairs.reduce do |acc, el|
    if (prices[el[1]] - prices[el[0]]) > (prices[acc[1]] - prices[acc[0]])
      acc = el
    else
      acc
    end
  end
  return arr if prices[arr[0]] < prices[arr[1]]
end


private 
def get_pairs(arr)
  res = []
  (0...(arr.length - 1)).each do |i|
    (i + 1...arr.length).each do |j|
      res << [i, j]
    end
  end
  res
end