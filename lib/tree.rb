# frozen_string_literal: true

require './lib/node'

# This class creates a Binary Search Tree
class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr.sort.uniq
    @root = build_tree(@arr)
  end

  def build_tree(arr)
    return Node.new(arr[0]) if arr.size <= 1

    mid = (arr.length / 2).floor
    root_node = Node.new(arr[mid])
    root_node.left = build_tree(arr[0..(mid - 1)])
    root_node.right = build_tree(arr[(mid + 1)..])
    root_node
  end

  def insert
  end

  def delete
  end

  def find(value, root = @root)
    if root.value.nil?
      "Value: '#{value}' is not in the list."
    elsif value == root.value
      root
    elsif value < root.value
      find(value, root.left)
    else
      find(value, root.right)
    end
  end

  def inorder
  end

  def preorder
  end

  def postorder
  end

  def height(node)
  end

  def depth(node)
  end

  def balanced?
  end

  def rebalance
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
