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

  describe '#get_input' do
    context 'mode selection: with valid input provided during first entry' do
      let(:regex) { /\A[1-2]\z/ }
      let(:prompt_msg) { 'Please provide a mode number (1 or 2)...' }

      before do
        allow(caesar_cipher).to receive(:puts)
        allow(caesar_cipher).to receive(:gets).and_return('1')
      end
      it 'prompts the user with the correct message' do
        expect(caesar_cipher).to receive(:puts).with("\n* Please provide a mode number (1 or 2)...")
        caesar_cipher.get_input(regex, prompt_msg)
      end

      it 'returns 1 when user enter 1' do
        result = caesar_cipher.get_input(regex, prompt_msg)
        expect(result).to eq('1')
      end
    end

    context 'get message: with valid input provided during first entry' do
      let(:regex) { /.*/ }
      let(:prompt_msg) { 'Please provide a message...' }

      before do
        allow(caesar_cipher).to receive(:puts)
        allow(caesar_cipher).to receive(:gets).and_return('USS-Enterprise')
      end
      it 'prompts the user with the correct message' do
        expect(caesar_cipher).to receive(:puts).with("\n* Please provide a message...")
        caesar_cipher.get_input(regex, prompt_msg)
      end

      it 'returns USS-Enterprise when user enter USS-Enterprise' do
        result = caesar_cipher.get_input(regex, prompt_msg)
        expect(result).to eq('USS-Enterprise')
      end
    end

    context 'shift input: with valid input provided during first entry' do
      let(:regex) { /\A[0-9]*\z/ }
      let(:prompt_msg) { 'Enter a number to set the character shift...' }

      before do
        allow(caesar_cipher).to receive(:puts)
        allow(caesar_cipher).to receive(:gets).and_return('26')
      end
      it 'prompts the user with the correct message' do
        expect(caesar_cipher).to receive(:puts).with("\n* Enter a number to set the character shift...")
        caesar_cipher.get_input(regex, prompt_msg)
      end

      it 'returns 26 when user enter 26' do
        result = caesar_cipher.get_input(regex, prompt_msg)
        expect(result).to eq('26')
      end
    end

    context 'when user types exit' do
      let(:regex) { /.*/ }
      let(:prompt_msg) { 'Please provide a message...' }

      before do
        allow(caesar_cipher).to receive(:puts)
        allow(caesar_cipher).to receive(:gets).and_return('exit')
        allow(caesar_cipher).to receive(:exit)
      end

      it 'calls exit' do
        expect(caesar_cipher).to receive(:exit)
        caesar_cipher.get_input(regex, prompt_msg)
      end
    end
  end
end
