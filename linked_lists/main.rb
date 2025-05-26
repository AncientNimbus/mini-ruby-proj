# frozen_string_literal: true

require_relative 'linked_list'

list = LList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

p list.head
# puts list.to_s
