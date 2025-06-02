# frozen_string_literal: true

require_relative '../caesar_cipher'

describe CaesarCipher do
  subject(:caesar_cipher) { described_class.new }

  describe '#main' do
    # script method
  end

  describe '#user_input' do
    # script method
  end

  describe '#get_input' do
    # query method
  end

  describe '#caesar_cipher' do
    # query method
  end

  describe '#shift_character' do
    # query method
    context 'with uppercase letter' do
      it 'converts to lowercase and applies 0 shift factor' do
        expect(caesar_cipher.shift_character('A', 0)).to eq('a')
      end
    end
  end
end
