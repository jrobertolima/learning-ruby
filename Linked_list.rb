# Implementing a linked list 
class Entry
  attr_accessor :data, :next
  
  def initialize(data)
    @data = data
    @next = nil
  end
end
      
class LinkedList
  include Enumerable # to include each methdo in the linked list
  attr_accessor :name
  
  def initialize
    @head = nil
    @tail = nil
  end
# each method for linked list  
  def each
    return nil if @head.nil?
    entry = @head
    until entry.nil?
      yield entry, 
      entry = entry.next    
    end
  end

# each_with_index method for linked list  
  def each_with_index
    return nil if @head.nil?
    node_index = 1 #I'll consider first node as 1 
    entry = @head
    until entry.nil?
      yield entry, node_index
      entry = entry.next
      node_index +=1
    end
  end
  
#Appends a new entry to the end of the list
  def append(newEntry)
    if @head.nil?
      @head = newEntry
      @tail = newEntry 
    else
      @tail.next = newEntry
      @tail = newEntry
    end    
  end
  
# Adds a new entry to the top of the list
  def prepend(newEntry)
    if @head.nil?
      @head = newEntry
      @tail = newEntry 
    else
      newEntry.next = @head 
      @head = newEntry
    end       
  end
  
# returns total number of nodes in the list
  def size
    return 0 if @head.nil?

    n = 0
    self.each { n += 1}
    return n
  end

# returns the node at the given index. First node has the position 1
    def at(index)
      return nil if @head.nil? 
      return @head if index == 1
      return nil if index > self.size
#      ind = 1
      self.each_with_index do |current, ind|
        return current if ind == index
      end

    end

#  removes the last element from the list    
    def pop
      return nil if @head.nil?
      if self.size > 1
        @tail = self.at(self.size-1) 
        @tail.next = nil
      else # only 1 node
        @tail = @head = nil
      end	
    end
    
# returns true if the passed in value is in the list
# and otherwise returns false.   
    def contains? (value)
      return false if @head.nil?

      self.each {|current| return true if current.data == value}
      
      return false 
    end 

# returns the index of the node containing data, or nil if not found.    
    def find(data)
      return nil if @head.nil?
#      i = 1
      self.each_with_index do |current, ind| 
        return ind if current.data == data
      end 
  	  return nil # not found	
    end

# inserts the node at the given index    
    def insert_at(newEntry, index)
      return false if @head.nil? || index > self.size # will not consider a index out of list
      
      if self.size == 1 || index == 1 #list has just 1 node or it is the first one
        prepend(newEntry) 
      else	
          temp_node = self.at((index-1))
          newEntry.next = temp_node.next
          temp_node.next = newEntry
      end
      return true	
    end
    
# removes the node at the given index (You will need to update the links of your nodes in the list when you remove a node.)    
	def remove_at(index)
	  return false if @head.nil? || index > self.size 

	  if self.size == 1 || index == self.size #only one node or the last one
	    self.pop 
	  elsif index == 1 # first node in the list: shift
		  @head = @head.next
	  else	
	    temp_node = self.at(index)
	    node_ant	= self.at(index-1)
	    node_ant.next = temp_node.next
	    temp_node.next = nil
    end
      return true	  
	end

# represent your LinkedList objects as strings, so you can print them
# out and preview them in the console.
# The format should be: ( data ) -> ( data ) -> ( data ) -> nil
    def to_s
      res = ""
      self.each {|current|  res << " ( #{current.data} ) -> " }
      res <<  "nil"
      end
end   

puts "Creating list..."
ll = LinkedList.new
puts ll.to_s

puts "Populating list"
1.upto(10) do |i|
   ll.append(Entry.new("node #{i}"))
end
puts ll.to_s

puts "Prepending 3 nodes..."
3.downto(1) do |i|
   ll.prepend(Entry.new("Pre #{i}"))
end
puts ll.to_s

puts "Inserting nodes..."
2.upto(4) do |i|
   ll.insert_at(Entry.new("Inserted node #{i}"), i )
end
puts ll.to_s

puts "Searching for nodes..."
puts "Contain 'Nada?' #{ll.contains? ("nada")}"
puts "Contain 'node 5?' #{ll.contains? ("node 5")}"

puts "Poping 2 nodes..."
p ll.pop
p ll.pop
puts ll.to_s

puts  "Removing nodes at..."
3.upto(5) do |i|
  ll.remove_at(i)
end
puts ll.to_s
puts "Removing the last node..."
p ll.remove_at(ll.size)
puts ll.to_s      
