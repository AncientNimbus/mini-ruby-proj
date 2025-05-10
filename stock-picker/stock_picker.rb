# frozen_string_literal: true

def stock_picker(eod_price_arr)
  max_profit = 0
  best_days = [0, 0]
  min_price_day = 0

  eod_price_arr.each_with_index do |price, day|
    # Update the day with min price
    min_price_day = day if price < eod_price_arr[min_price_day]

    # Calculate profit
    profit = price - eod_price_arr[min_price_day]

    # Update best days
    if profit > max_profit
      max_profit = profit
      best_days = [min_price_day, day]
    end
  end

  best_days
end

# eod_price = [17, 3, 6, 9, 15, 8, 6, 1, 10]
# p stock_picker(eod_price)
