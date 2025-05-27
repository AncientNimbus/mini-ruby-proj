# frozen_string_literal: true

require_relative 'hash_map'

test = HMHash.new

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
100.times { |i| test.set("key#{i}", "value#{i}") }
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
