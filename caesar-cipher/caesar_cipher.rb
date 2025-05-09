# frozen_string_literal: true

ALPHABETS = 'abcdefghijklmnopqrstuvwxyz'

def shift_character(char, shift = 0)
  # Helper methods to shift character space
  # char {string} - single character
  # shift {number} - shift factor
  char = char.downcase
  # ALPHABETS.chars.index { |ref_char| ref_char == char }
  # char
  char.swapcase
end

def caesar_cipher(str, shift = 0)
  # str {string} - target string
  # shift {number} - shift factor
  str_arr = str.chars.map do |char|
    if ALPHABETS.include?(char.downcase)
      new_char = shift_character(char, shift)
      char == char.upcase ? new_char.swapcase : new_char
    else
      # preserve punctuation and whitespace
      char
    end
  end
  str_arr.join('')
  # puts "String: #{str}, Shift: #{shift} \nExpected result:"
  # 'Bmfy f xywnsl!'
end

puts caesar_cipher('What a string!', 5)
