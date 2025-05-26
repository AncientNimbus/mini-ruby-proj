# frozen_string_literal: true

require_relative 'linked_list'

list = LList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
list.prepend('bean')
list.prepend('toast')

# p list.head
p list.at(2, 0)
# p list.to_s
# list.insert_at('Shiba Inu', 2)
p list.to_s
# p list.tail_node
# puts list.to_s
