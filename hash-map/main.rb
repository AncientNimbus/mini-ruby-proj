# frozen_string_literal: true

require_relative 'hash_map'

test = HMHash.new

# p test.hash('Spock')
test.set('Spock', 'LLAP')
test.set('Bean', 'I am Mr. Bean')
test.set('Harry', 'I am Mr. Potter')
test.set('Bean', 'Bean...')
test.set('Harry', 'I know Magic')
p test.get('Harry')
# p test.remove('Spock')
p test.has?('Spock')
p test.length
# test.clear
p test.keys
p test.values
# p test.set('Spock', 'Live long and prosper')
# p test.set('Picard', 'Earl Grey, Hot')
