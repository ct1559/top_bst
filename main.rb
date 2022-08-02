# frozen_string_literal: true

require './lib/tree'

def run_tests
  arr = (Array.new(15) { rand(1..100) })
  puts 'The array passed into tree:'
  p arr.sort.uniq
  bst = Tree.new(arr)
  bst.pretty_print
  puts bst.find(arr[0])
  puts bst.find(101)
  puts bst.find(rand(1..100))
end

run_tests
