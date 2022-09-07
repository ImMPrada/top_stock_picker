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

  describe 'days_filter' do
    let(:residual_prices) { [6, 9, 15, 8, 6, 1, 10] }
    let(:buy_day) { 1 }
    let(:buy_price) { 3 }
    let(:max_profit) { 0 }
    let(:buy_sell) { [] }

    it 'returns an array of size 2' do
      days_filter(buy_day, buy_price, max_profit, residual_prices, buy_sell).size.should == 2
    end

    it 'returns [profit, [day_sell, day_buy(relative to day_sell)]]' do
      days_filter(buy_day, buy_price, max_profit, residual_prices, buy_sell).should == [12, [1, 3]]
    end
  end
end
