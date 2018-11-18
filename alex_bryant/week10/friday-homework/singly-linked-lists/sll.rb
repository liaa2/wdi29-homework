require 'pry'

class SinglyLinkedList

  attr_accessor :head, :tail

  #The Node class can only be used from within
  # the SinglyLinkedList class
  class Node
    attr_accessor :value, :next, :before
    #Class variable to keep track of nodes created
    @@nodes_created = 0
    #Return nodes created
    def self.nodes_created
      # Return the value of this variable
      @@nodes_created
    end
    # Subtract 1 from total if node destroyed
    def self.node_destroyed
      # Return the value of this variable
      @@nodes_created -= 1
    end
    def initialize(value)
      @@nodes_created += 1
      @value = value
      @next = nil
      @before = nil
    end
    def to_s
      @value
    end
  end #Node

  def initialize(value)
    #Create a new instance of the Node class, pass
    # the value argument down to it, and set
    #the new value it returns as the head of the list
    @head = Node.new value
    @tail = @head
  end

  # same as .unshift(value) for arrays
  def prepend(value)
    #Instantiate the object to be the new head
    new_node = Node.new value
    #Set its next value to the current head
    new_node.next = @head
    @head.before = new_node
    #Set the new one as the new head by repointing SinglyLinkedList head to it
    @head = new_node
  end

  def append(value)
    new_last = Node.new(value)
    @tail.next = new_last
    new_last.before = @tail
    @tail = new_last
  end

  #Make the output more readable by translating it to a string
  def to_s
    output = ''
    node = @head
    # check if the next element is truthy
    while node
      output += node.value.to_s
      output +=  ', ' if node.next
      node = node.next
    end
    output
  end

  #return the first element in a list
  def first
    @head
  end

  #return the last element in a list
  def last
    @tail
  end

  def length
    #returns the length of the list
    Node.nodes_created
  end

  def shift
    #remove the first Node of the list and return it
    #(destructive, i.e. changes the list)
    Node.node_destroyed
    #This is repointing the list to a new head, effectively leaving
    #the original in memory for garbage collection
    @head = @head.next
  end

  def at_index(n)
    #return node object at position n in the
    #list same as array[n]
    #Return error if out of bounds
    return "Error: index #{n} is out of bounds" if (n >= Node.nodes_created)
    return "Error: cannot find negative index #{n}" if (n < 0)
    #Optimize starting position
    if(Node.nodes_created - n >= n)
      #Start at the start
      node = @head
      count = 0
      while node
        return node if n == count
        count += 1
        node = node.next
      end
    elsif(Node.nodes_created - n < n)
      #Start at the end
      node = @tail
      count = Node.nodes_created - 1
      while node
        return node if n == count
        count -= 1
        node = node.before
      end
    end
  end

  #Might be a better way as this always starts at index 0
  def find(needle)
    #return the Node object whose value == needle
    node = @head
    while node
      return node if node.value == needle
      node = node.next
    end
    #Return nil if cannot find it
    nil
  end

  def insert_after(node, value)
    #insert a new node after the given node
    #Create new node and place correct labels locally
    new_node = Node.new(value)
    #If there is a next node, define it
    if node.next
      next_node = node.next
      next_node.before = new_node
    else
      #If not need to reset tail
      @tail = new_node
    end
    #Make changes to node 'next' label and new node 'before' and 'next' labels
    node.next = new_node
    new_node.before = node
    #New node only has a next if there was one in the first place
    new_node.next = next_node if node.next
    self
  end

  def reverse
    #returns a reversed version of the list
    #without changing the original list
    #(non-destructive)
    node = @tail
    list = SinglyLinkedList.new(node.value)
    while node.before
      node = node.before
      list.append(node.value)
    end
    list
  end

  def reverse!
    #returns a reversed version of the list
    #(destructive)
    node = @tail
    @head = node
    while node
      before_val = node.before.dup
      node.before = node.next
      node.next = before_val
      if before_val
        node = before_val
      else
        @tail = node
        break
      end
    end
    self
  end

  def each
    #take a block, and runs the block
    #for each node in the list
    #(i.e. the current node is provided
    # as a block vairable/goalpost arg, e.g.
    #list.each do |value|
    #   puts node.value
    # end
    #HINT: look up 'yield'
    node = @head
    while node
      yield( node.value )
      node = node.next
    end
  end

  def map(&block)
    result = []
    self.each do |element|
      #Check if numerical data. If not return nil.
      if(!element.is_a? Numeric)
        puts "Data not numerical"
        return nil
      end
      result.push(block.call(element))
    end
    result
  end

  def inject(total=0, &block)
    self.each do |element|
      #Check if numerical data. If not return nil.
      if(!element.is_a? Numeric)
        puts "Data not numerical"
        return nil
      end
      #For some reason you have to set 0 as the sum each time
      # puts "1. total = #{total}, element = #{element}"
      total += (block.call(element, 0))
      # puts "2. total = #{total}, element = #{element}"
    end
    total
  end

end #SinglyLinkedList

list = SinglyLinkedList.new 'Groucho'
list.prepend 'Chico'
list.prepend 'Harpo'
list.prepend 'Zeppo'

list2 = SinglyLinkedList.new 3
list2.prepend 5
list2.prepend 6
list2.prepend 8

binding.pry
puts "Done."
