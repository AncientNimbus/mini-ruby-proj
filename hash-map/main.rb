# frozen_string_literal: true

require_relative 'hash_map'
require_relative 'hash_set'

test = HMHash.new
test_set = HSet.new

test.set('apple', 'red')
# test.set('banana', 'yellow')
# test.set('carrot', 'orange')
# test.set('dog', 'brown')
# test.set('elephant', 'gray')
# test.set('frog', 'green')
# test.set('grape', 'purple')
# test.set('hat', 'black')
# test.set('ice cream', 'white')
# test.set('jacket', 'blue')
# test.set('kite', 'pink')
# p test.buckets.size
# test.set('lion', 'golden')
# 100.times { |i| test.set("key#{i}", "value#{i}") }
# p test.entries
# p test.length
# p test.set('apple', 'green')
# p test.set('jacket', 'red')
# p test.set('lion', 'green')
# p test.entries
# p test.length
# p test.buckets.size
# test.set('moon', 'silver')
# p test.entries
# p test.length
# p test.buckets.size
# p test.has?('key10')
# p test.clear
# p test.buckets.size

p test_set.capacity
50.times { |i| test_set.set("value#{i}") }
p test_set.remove('value43')
p test_set.has?('value43')
p test_set.keys
p test_set.length
p test_set.entries
p test_set.capacity
