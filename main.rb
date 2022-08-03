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
  puts "Height of node is: #{bst.depth(bst.root)}"

  arr_2 = (Array.new(20) { rand(1..100) })
  puts 'The array passed into tree:'
  p arr_2.sort.uniq
  bst_2 = Tree.new(arr_2)
  bst_2.pretty_print
  puts bst_2.find(arr[0])
  puts bst_2.find(101)
  puts bst_2.find(rand(1..100))
  puts "Depth of node is: #{bst_2.depth(bst_2.root)}"
end

run_tests
