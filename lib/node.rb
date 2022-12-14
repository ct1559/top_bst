# frozen_string_literal: true

# This class creates a node in a linked list
class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end
