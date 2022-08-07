# frozen_string_literal: true

require './lib/tree'

def run_tests
  arr = (Array.new(15) { rand(1..100) })
  puts 'The array passed into tree:'
  p arr.sort.uniq
  # Build tree test
  bst = Tree.new(arr)
  bst.pretty_print
  # Find test
  puts bst.find(arr[0])
  puts bst.find(101)
  puts bst.find(rand(1..100))
  # Depth, Height and Balance test
  puts "Depth of #{bst.find(arr[0])} with value: #{bst.find(arr[0]).value}, is: #{bst.depth(bst.find(arr[0]))}"
  puts "Height of #{bst.find(arr[0])} is #{bst.height(bst.find(arr[0]))}"
  puts "Tree is balanced: #{bst.balanced?}"
  # Level order test
  puts 'Level Order values:'
  p bst.level_order
  sum = 0
  puts 'Level order with block given:'
  p bst.level_order { |value| sum += value}
  # Insert test
  bst.insert(101)
  bst.insert(160)
  bst.insert(110)
  bst.insert(136)
  bst.pretty_print
  puts "Tree is balanced: #{bst.balanced?}"
  # Delete test
  puts "Deleting #{arr[0]} from tree"
  bst.delete(arr[0])
  bst.pretty_print


  # arr_2 = (Array.new(20) { rand(1..100) })
  # puts 'The array passed into tree:'
  # p arr_2.sort.uniq
  # bst_2 = Tree.new(arr_2)
  # bst_2.pretty_print
  # puts bst_2.find(arr_2[0])
  # puts bst_2.find(101)
  # puts bst_2.find(rand(1..100))
  # puts "Depth of #{bst_2.find(arr_2[0])} with value: #{bst_2.find(arr_2[0]).value}, is: #{bst_2.depth(bst_2.find(arr_2[0]))}"
  # puts "Height of #{bst_2.find(arr_2[0])} is #{bst_2.height(bst_2.find(arr_2[0]))}"
  # puts "Tree is balanced: #{bst_2.balanced?}"
  # bst_2.insert(5)
  # bst_2.insert(4)
  # bst_2.insert(2)
  # bst_2.insert(1)
  # bst_2.pretty_print
  # puts "Tree is balanced: #{bst_2.balanced?}"
end

run_tests
