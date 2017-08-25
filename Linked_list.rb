# Implementing a linked list 

class Entry
  attr :data, :next
  
  def initialize(data)
    @data = data
    @next = nil
  end
end
      
class LinkedList
  attr :name
  
  def initialize
    @head = nil
    @tail = nil
  end
  
#Appends a new entry to the end of the list
  def append(newEntry)
    if head.nil?
      @head = newEntry
      @tail = newEntry 
    else
      newEntry.next = nil
      @tail.next = newEntry
    end    
  end
  
# Adds a new entry to the top of the list
  def prepend(newEntry)
    if head.nil?
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
    n = 1
    current = @head
    until current.next.nil? 
      current = current.next
      n += 1
    end
    return n
  end

# returns first entry
    def head
      return @head
    end
    
# returns last entry
    def tail
      return @tail
    end

# returns the node at the given index. Firsp node has the position 1
    def at(index)
      return nil if @head.nil?
      return @head if index == 1
      
      current = @head
      1.upto(index) do
        current = current.next    
      end
      return current
    end

#  removes the last element from the list    
    def pop
      return nil if @head.nil?
      @tail = self.at(self.size-1)
      @tail.next = nil
    end
    
# eturns true if the passed in value is in the list
# and otherwise returns false.   
    def contains?(value)
      return false if @head.nil?
      return true if @head.data == value
      
      current = @head    
      until current.data == value || current.next.nil?
        current = current.next
      end
      
      return current.data == value    
    end 

# returns the index of the node containing data, or nil if not found.    
    def find(data)
      return nil if @head.nil?
      
      current = @head
      until current.data == data || i > self.size
        current = current.next       
      end    
      
      return current.data == data  
    end

# represent your LinkedList objects as strings, so you can print them
# out and preview them in the console.
# The format should be: ( data ) -> ( data ) -> ( data ) -> nil
    def to_s
      current = @head 
      until current.next.nil?
        print " ( #{current.data } -> "
      end
        print "nil"
    end
end   

node = Entry.new("Primeiro")
ll = LinkedList.new
node = Entry.new("segundo")
ll.append(node)
node = Entry.new("Antes do primeito")
ll.prepend(node)
ll.append(Entry.new("Último"))
ll.to_s


       