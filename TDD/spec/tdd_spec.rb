require "tdd"
require "rspec"
require "byebug"


describe Array do
  subject(:arr){Array.new}
  describe("#my_uniq") do 
  #  debugger
    
    context("if array is empty") do
        it("returns empty array") do
          expect(arr.my_uniq).to be_empty
        end
    end
    context("if array has duplicates") do 
      it("returns the uniq elements") do
        # before(:each) do 
        # end
        arr.concat([1, 1, 2, 3])
        expect(arr.my_uniq).to eq([1,2,3])
      end
    end
  end

  describe("#two_sum") do 
    context("if the array is empty") do 
      it("returns empty array") do 
        expect(arr.two_sum).to be_empty
      end
    end
    context("if there are no zero sum pairs") do
      it("returns empty array") do 
        arr.concat([1,2,3,4])
        expect(arr.two_sum).to be_empty
      end
    end
    context("if there are zero sum pairs") do 
      it("returns dictionary-wise elements") do 
        arr.concat([-1, 0, 2, -2, 1])
        expect(arr.two_sum).to eq([[0,4],[2,3]])
      end
    end 
  end

  describe("#my_transpose") do
    context("if the array is empty") do 
      it("returns an empty array") do 
        expect(arr.my_transpose).to be_empty
      end
    end
    context("if the array is one-dimensional") do
      it("raises an ArgumentError") do
        arr.concat([1, 2, 3, 4])
        expect{arr.my_transpose}.to raise_error(ArgumentError)
      end
    end
    context("if the array is two-dimensional") do
      context("and the array is N by N") do
        it("returns a transposed array") do
          arr.concat([[0, 1], [2, 3]])
          expect(arr.my_transpose).to eq([[0, 2], [1, 3]])
        end
      end
      context("and the array is M by N") do
        it("return a transposed array ") do 
          arr.concat([[0, 1, 2, 3]])
          expect(arr.my_transpose).to eq([[0], [1], [2], [3]])
        end
      end
    end
  end
end

describe "#stock_picker" do 
  let(:prices) {[1,4,7,8,9,7,4,2,5,6,4]}
  context("if the input is not and array") do 
    it("raises an ArgumentError") do 
      expect{stock_picker("not an array")}.to raise_error(ArgumentError)
    end
  end
  context("if the input dosn't have enought data") do
    it("return nil") do 
      expect(stock_picker([1])).to be_nil
    end
  end
  context("if there are no profitable days") do 
    it("returns nil") do 
      bad_prices = [5,4,3,2,1]
      expect(stock_picker(bad_prices)).to be_nil
    end
  end
  context("if there are some profitable days") do 
    it("returns array with different start day and end day") do
      start_day, end_day= stock_picker(prices)
      expect( start_day < end_day ).to be true
    end
    it("returns the most profitable days") do
      expect(stock_picker(prices)).to eq([0,4])
    end
  end
end