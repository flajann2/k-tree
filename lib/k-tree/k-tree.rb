=begin rdoc
= K-Tree -- a generalization of Quadtrees and Octrees

=end

require 'matrix'

module KTree
  class KTreeException < Exception
  end

  def self.create(vupper = Vector[1.0, 1.0], vlower = Vector[-1.0, -1.0], depth=5, &block)
    KTree.new(vupper , vlower, depth, &block)
  end

  class KTree
    include Enumerable

    attr_reader :tuple, :depth
    attr_accessor :root

    # A node containing other nodes, 2^tuple
    class Node
      include Enumerable

      # Coordinates of this node
      attr_reader :center, :upper, :lower, :tuple, :depth

      # Reference object for this node
      attr_accessor :refob

      def initialize(vupper, vlower, depth)
        @upper = vupper
        @lower = vlower
        @depth = depth
        @center = (vupper + vlower) / 2.0
        @tuple = vupper.size
      end

      def children; @children ||= []; end

      # iterate through all the upper, lower vectors
      # of the possible children
      def ntants
        d = @upper - @center
        (0...(2**@tuple)).map do |bits|
          k = [Vector[*(0...@tuple).map{|i| (bits & (1 << 1)) == 0 ? @center[i]+d[i] : @center[i]-d[i]}], @center]
          yield *k if block_given?
          k
        end
      end

      # recursive function to create child nodes.
      def create_children(&block)
        if block.(self, cv = ntants)
          @children = cv.map{|vupper, vlower| Node.new(vupper, vlower, @depth - 1)}
          @children.each{|child| child.create_children &block}
        end unless @depth == 0
      end

      def each(&block)
        block.(self)
        children.each{|child| child.each &block }
      end
    end

    def initialize(vupper , vlower, depth, &block)
      @tuple = vupper.size
      @depth = depth
      @root = nil
      raise KTreeException.new('tuple mismatch') unless vlower.size == vupper.size
      create_tree(vupper, vlower, &block)
    end

    # The block is passed node itself as parent and the vector midpoints of
    # its children to be.
    #
    # The block sets is own refob, and returns either true, in which case
    # all the children are created, or it returns false, in which case none
    # of the children will be created, in effect, marking itself as a leaf
    # node.
    def create_tree(vupper, vlower, &block)
      @root = Node.new(vupper, vlower, @depth)
      @root.create_children &block
    end

    # Iterate through all nodes
    def each(&block)
      root.each(&block)
    end
  end
end
