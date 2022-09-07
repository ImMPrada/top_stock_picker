require './spec/spec_helper'

describe 'lib/main' do
  describe 'stock_picker' do
    let(:prices) { [17, 3, 6, 9, 15, 8, 6, 1, 10] }

    it 'returns an array of size 2' do
      stock_picker(prices).size.should == 2
    end

    it 'returns the day at position 1 (buy) and position 4 (sell)' do
      stock_picker(prices).should == [1, 4]
    end
  end
end
