# frozen_string_literal: true

require_relative 'hash_map'

test = HMHash.new

# p test.hash('Spock')
# test.set('Spock', 'LLAP')
# test.set('Bean', 'I am Mr. Bean')
# test.set('Harry', 'I am Mr. Potter')
# test.set('Bean', 'Bean...')
# test.set('Harry', 'I know Magic')
# p test.get('Harry')
# # p test.remove('Spock')
# p test.has?('Spock')
# p test.length
# # test.clear
# p test.keys
# p test.values
# p test.entries
# p test.set('Spock', 'Live long and prosper')
# p test.set('Picard', 'Earl Grey, Hot')

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
p test.buckets.size
test.set('lion', 'golden')
20.times { |i| test.set("key#{i}", "value#{i}") }
p test.entries
p test.length
p test.set('apple', 'green')
p test.set('jacket', 'red')
p test.set('lion', 'green')
p test.entries
p test.length
p test.buckets.size
test.set('moon', 'silver')
p test.entries
p test.length
p test.buckets.size
p test.has?('key10')
p test.clear
p test.buckets.size
