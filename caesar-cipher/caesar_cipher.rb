# frozen_string_literal: true

# Caesar Cipher class
class CaesarCipher
  ALPHABETS = [*'a'..'z'].freeze
  INTRO = <<~INTRO
    ( ___ )             ( ___ )
     |   |~~~~~~~~~~~~~~~|   |
     |   | CAESAR CIPHER |   |
     |___|~~~~~~~~~~~~~~~|___|
    (_____)             (_____)
    -=-._.-=-._.-=-._.-=-._.-=-
      v1.7: By Ancient Nimbus
    -=-._.-=-._.-=-._.-=-._.-=-

    Let's get started...

    Mode selection:
    1) Encrypt
    2) Decrypt

    Type 'exit' to quit the program at any point.
  INTRO
  STEPS = {
    mode: { re: /\A[1-2]\z/, prompt_msg: 'Please provide a mode number (1 or 2)...' },
    msg: { re: /.*/, prompt_msg: 'Please provide a message...' },
    shift: { re: /\A[0-9]*\z/, prompt_msg: 'Enter a number to set the character shift...' }
  }.freeze
  at_exit { puts "\nThank you for using the Cipher. :)" }

  def initialize
    main
  end

  # Helper methods: Shift character space
  # @param char [String] single character
  # @param shift [Integer] shift factor
  def shift_character(char, shift = 0)
    char = char.downcase
    char_pos = ALPHABETS.index(char)
    new_char_pos = (char_pos + shift) % ALPHABETS.length
    ALPHABETS[new_char_pos]
  end

  # Caesar Cipher
  # @param str [String] target string
  # @param shift [Integer] shift factor
  def caesar_cipher(str, shift = 0)
    str_arr = str.chars.map do |char|
      if ALPHABETS.include?(char.downcase)
        new_char = shift_character(char, shift)
        char == char.upcase ? new_char.upcase : new_char
      else
        # preserve punctuation and whitespace
        char
      end
    end
    str_arr.join
  end

  # Get input from user
  # @param regex [Regexp]
  # @param prompt_msg [String]
  def get_input(regex, prompt_msg)
    input_value = ''
    until input_value =~ regex && input_value.empty? == false
      puts "\n* #{prompt_msg}"
      input_value = gets.chomp
      # Keyword to quit the program early
      exit if input_value == 'exit'
    end
    input_value
  end

  # User input flow control
  def user_input
    user_input_data = { mode: 0, msg: '', shift: nil }

    user_input_data[:mode] = get_input(STEPS.dig(:mode, :re), STEPS.dig(:mode, :prompt_msg)).to_i
    user_input_data[:msg] = get_input(STEPS.dig(:msg, :re), STEPS.dig(:msg, :prompt_msg))
    user_input_data[:shift] = get_input(STEPS.dig(:shift, :re), STEPS.dig(:shift, :prompt_msg)).to_i

    user_input_data
  end

  # Console program flow
  def main
    puts INTRO

    user_input_data = user_input
    mode, msg, shift = user_input_data.values_at(:mode, :msg, :shift)

    new_msg = mode == 1 ? caesar_cipher(msg, shift) : caesar_cipher(msg, -shift)

    puts "\nYour #{mode == 1 ? 'encrypted' : 'decrypted'} message: #{new_msg}"
    new_msg
  end
end
