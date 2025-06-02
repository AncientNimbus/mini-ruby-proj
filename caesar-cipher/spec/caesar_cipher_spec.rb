# frozen_string_literal: true

require_relative '../caesar_cipher'

describe CaesarCipher do
  subject(:caesar_cipher) { described_class.new }

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

  describe '#caesar_cipher' do
    context 'with a single word' do
      it "return 'mjiwe' when the word is 'spock' and shift factor is 20" do
        word = 'spock'
        result = caesar_cipher.caesar_cipher(word, 20)
        expect(result).to eq('mjiwe')
      end

      it "return 'spock' when the word is 'mjiwe' and shift factor is -20" do
        word = 'mjiwe'
        result = caesar_cipher.caesar_cipher(word, -20)
        expect(result).to eq('spock')
      end

      it "return 'Mjiwe' when the word is 'Spock' and shift factor is 20" do
        word = 'Spock'
        result = caesar_cipher.caesar_cipher(word, 20)
        expect(result).to eq('Mjiwe')
      end

      it "return 'Spock' when the word is 'Mjiwe' and shift factor is -20" do
        word = 'Mjiwe'
        result = caesar_cipher.caesar_cipher(word, -20)
        expect(result).to eq('Spock')
      end
    end

    context 'with multiple words with space' do
      it "return 'Mjwf mpoh boe qsptqfs' when the word is 'Live long and prosper' and shift factor is 1" do
        word = 'Live long and prosper'
        result = caesar_cipher.caesar_cipher(word, 1)
        expect(result).to eq('Mjwf mpoh boe qsptqfs')
      end

      it "return 'Live long and prosper' when the word is 'Mjwf mpoh boe qsptqfs' and shift factor is -1" do
        word = 'Mjwf mpoh boe qsptqfs'
        result = caesar_cipher.caesar_cipher(word, -1)
        expect(result).to eq('Live long and prosper')
      end
    end

    context 'with words and punctuations' do
      it "return 'Ufb, Fbsm Hsfz, Ipu.' when the word is 'Tea, Earl Grey, Hot.' and shift factor is 27" do
        word = 'Tea, Earl Grey, Hot.'
        result = caesar_cipher.caesar_cipher(word, 27)
        expect(result).to eq('Ufb, Fbsm Hsfz, Ipu.')
      end

      it "return 'Tea, Earl Grey, Hot.' when the word is 'Ufb, Fbsm Hsfz, Ipu.' and shift factor is -27" do
        word = 'Ufb, Fbsm Hsfz, Ipu.'
        result = caesar_cipher.caesar_cipher(word, -27)
        expect(result).to eq('Tea, Earl Grey, Hot.')
      end
    end
  end

  describe '#main' do
    # script method
  end

  describe '#user_input' do
    # script method
  end

  describe '#get_input' do
    # query method
  end
end
