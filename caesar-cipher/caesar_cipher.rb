# frozen_string_literal: true

ALPHABETS = 'abcdefghijklmnopqrstuvwxyz'

def shift_character(char, shift = 0)
  # Helper methods: Shift character space
  # char {string} - single character
  # shift {number} - shift factor
  char = char.downcase
  char_pos = ALPHABETS.chars.index { |ref_char| ref_char == char }
  new_char_pos = (char_pos + shift) % ALPHABETS.length
  new_char = ALPHABETS[new_char_pos]
  puts "New: #{new_char}"
  new_char
end

def caesar_cipher(str, shift = 0)
  # str {string} - target string
  # shift {number} - shift factor
  str_arr = str.chars.map do |char|
    if ALPHABETS.include?(char.downcase)
      new_char = shift_character(char, shift)
      char == char.upcase ? new_char.upcase : new_char
    else
      # preserve punctuation and whitespace
      char
    end
  end
  puts "String: #{str}, Shift: #{shift} \nExpected result:"
  str_arr.join('')
end

# puts caesar_cipher('What a string!', 5)
