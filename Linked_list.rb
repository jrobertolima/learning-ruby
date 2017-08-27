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
  
#Appends a new entry to the end of the list
  def each
    return nil if @head.nil?

    entry = @head

    until entry.nil?
      yield entry
      entry = entry.next
    end
  end

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
    return if @head.nil?
    n = 0

    self.each { n += 1}

    return n
  end


# returns the node at the given index. Firsp node has the position 1
    def at(index)
      return nil if @head.nil?
      return @head if index == 1

      ind = 1
      self.each do |current|
        return current if ind == index
        ind += 1
      end

    end

#  removes the last element from the list    
    def pop
      return nil if @head.nil?
	  if self.size > 1
        @tail = self.at(self.size-1) 
        @tail.next = nil
	  else
		@tail = @head = nil
	  end	
    end
    
# eturns true if the passed in value is in the list
# and otherwise returns false.   
    def contains? (value)
      return false if @head.nil?
      return true if @head.data == value

      self.each {|current| return true if current.data == value}
      
      return false 
    end 

# returns the index of the node containing data, or nil if not found.    
    def find(data)
      return nil if @head.nil?
      i = 1
      self.each do |current| 
        return i if current.data == data
        i += 1
      end 
	  return nil	
    end

# inserts the node at the given index    
    def insert_at(newEntry, index)
	  return false if @head.nil? || index > self.size 
	  
	  if self.size == 1 || index == 1
	    prepend(newEntry) 
	  else	
        temp_node = self.at((index-1))
        newEntry.next = temp_node.next
        temp_node.next = newEntry
	  end
	  return true	
    end
#remove_at(index) that removes the node at the given #index (You will need to update the links of your nodes in the list when you remove a node.)    
	def remove_at(index)
	  return false if @head.nil? || index > self.size 

	  if self.size == 1 || index == self.size
	    self.pop 
	  elsif index == 1
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
      self.each {|current|  print " ( #{current.data} ) -> " }
      puts "nil"
    end
end   

node = Entry.new("Primeiro")
ll = LinkedList.new
ll.append(node)
node = Entry.new("segundo")
ll.append(node)
ll.prepend(Entry.new("Antes do primeiro"))
ll.append(Entry.new("Último"))
ll.to_s
p ll.at(1).data
p ll.find("Último")
p ll.contains? ("nada")
p ll.contains? ("segundo")
ll.prepend(Entry.new("Antes do primeiro primeiro"))
ll.append(Entry.new("Último deṕos do último"))
ll.to_s
ll.pop
ll.to_s
p "Inserindo..."
ll.insert_at(Entry.new("Inserindo na dois"),2)
ll.to_s
p "Removendo..."
ll.remove_at(3)
ll.to_s
p "Removendo a 1..."
ll.remove_at(1)
ll.to_s       
p "Removendo útlimo..."
ll.remove_at(ll.size)
ll.to_s      
ll.pop
ll.remove_at(4)
ll.to_s
p ll
ll.pop
ll.pop
ll.to_s
ll.append(Entry.new("Nova entrada"))
ll.to_s 
