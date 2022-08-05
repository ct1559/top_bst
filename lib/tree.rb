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
    return Node.new(arr[0]) if arr.size == 1
    return if arr.size == 0

    mid = (arr.length / 2).floor
    root_node = Node.new(arr[mid])
    root_node.left = build_tree(arr[0..(mid - 1)])
    root_node.right = build_tree(arr[(mid + 1)..])
    root_node
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?
    return if value == node.value

    if leaf?(node)
      if value < node.value
        node.left = Node.new(value)
      else
        node.right = Node.new(value)
      end
    else
      if value < node.value
        return node.left = Node.new(value) if node.left.nil?

        insert(value, node.left)
      else
        return node.right = Node.new(value) if node.right.nil? 

        insert(value, node.right)
      end
    end
  end

  def delete(value, node = @root, prev_node = @root, l_r = 'left')
    return "Node: #{node} not found in tree" if find(node.value).is_a?(String)

    # Go through tree until node is found
    if value < node.value
      delete(value, node.left, node, 'left')
    elsif value > node.value
      delete(value, node.right, node, 'right')
    else
      # If leaf node, just remove link from prev node
      if leaf?(node)
        if l_r == 'left'
          prev_node.left = nil
        else
          prev_node.right = nil
        end
      # If one child, move the child to prev node link
      elsif children(node) == 1
        if node.left.nil?
          if l_r == 'left'
            prev_node.left = node.right
          else
            prev_node.right = node.right
          end
        else
          if l_r == 'left'
            prev_node.left = node.right
          else
            prev_node.right = node.right
          end
        end
      else
        temp = min_value_node(node.right)
        puts temp
        node.value = temp.value
        delete(temp.value, node.right, node, 'right')
      end
    end
  end

  def find(value, node = @root)
    if node.nil? || node.value.nil?
      "Value: '#{value}' is not in the list."
    elsif value == node.value
      node
    elsif value < node.value
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  def inorder
  end

  def preorder
  end

  def postorder
  end

  def depth(node, current_node = @root, current_depth = 0)
    return "Node: #{node} not found in tree" if find(node.value).is_a?(String)

    if node == current_node
      current_depth
    elsif node.value < current_node.value
      depth(node, current_node.left, current_depth + 1)
    else
      depth(node, current_node.right, current_depth + 1)
    end
  end

  def depth_largest(node = @root, current_depth = 0)
    return current_depth if node.nil?
    return current_depth if node.left.nil? && node.right.nil?

    [depth_largest(node.left, current_depth + 1), depth_largest(node.right, current_depth + 1)].max
  end

  def height(node)
    return "Node: #{node} not found in tree" if find(node.value).is_a?(String)

    depth_largest - depth(node)
  end

  def balanced?
    ((depth_largest(@root.left) - depth(@root.left)) - (depth_largest(@root.right) - depth(@root.right))).abs <= 1
  end

  def rebalance
  end

  def leaf?(node)
    node.left.nil? && node.right.nil?
  end

  # Return count of children
  def children(node)
    if node.left.nil? && node.right.nil?
      0
    elsif !node.left.nil? && !node.right.nil?
      2
    else
      1
    end
  end

  def min_value_node(node)
    node = node.left until node.left.nil?
    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
