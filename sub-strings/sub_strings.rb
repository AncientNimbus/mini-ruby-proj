def substrings(str, dict_arr)
  count_word = Hash.new(0)
  str = str.downcase

  dict_arr.each do |dict_word|
    index = 0
    while (index = str.index(dict_word, index))
      count_word[dict_word] += 1
      index += 1
    end
  end
  count_word
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit].freeze
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
