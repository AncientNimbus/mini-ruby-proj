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
    context 'with uppercase letter' do
      it 'converts to lowercase with shift factor sets to 0' do
        expect(caesar_cipher.shift_character('A', 0)).to eq('a')
      end

      it 'converts to lowercase with shift factor sets to 25' do
        expect(caesar_cipher.shift_character('A', 25)).to eq('z')
      end
    end

    context 'with lowercase letter' do
      it 'remains as lowercase with shift factor sets to 0' do
        expect(caesar_cipher.shift_character('a', 0)).to eq('a')
      end

      it 'remains as lowercase with shift factor sets to 25' do
        expect(caesar_cipher.shift_character('a', 25)).to eq('z')
      end
    end

    context 'with large shift factor' do
      it 'wraps around correctly when alphabets set has 26 characters' do
        expect(caesar_cipher.shift_character('a', 26)).to eq('a')
      end

      it 'wraps around correctly when shift factor is larger than alphabets set' do
        expect(caesar_cipher.shift_character('a', 105)).to eq('b')
      end
    end
  end
end
