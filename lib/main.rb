def days_filter (buy_day, buy_price, max_profit, residual_prices, buy_sell)
  max_price_to_sell = residual_prices.max
  profit = max_price_to_sell - buy_price

  return [max_profit, buy_sell] if profit < max_profit

  sell_day = residual_prices.find_index(max_price_to_sell) + buy_day + 1
  [profit, [buy_day, sell_day]]
end

def stock_picker(prices)
  buy_sell = []
  max_profit = 0

  prices.each_with_index do |buy_price, buy_day|
    residual_prices = prices[buy_day + 1..]

    break if residual_prices.empty?

    max_profit, buy_sell = days_filter(buy_day, buy_price, max_profit, residual_prices, buy_sell)
  end

  buy_sell
end
