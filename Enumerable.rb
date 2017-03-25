module Enumerable

	def my_each

		arr_res = self.to_a # if self is an Enumeration, converts to array
		
		if block_given?
			for i in (0..arr_res.length-1) do
				yield(arr_res[i])
			end
		else #when no block is given, returns an Enumeration
			arr_res.to_enum
		end
		
	end
	
	def my_each_with_index(*args)
		
		args.length == 0 ? num_elems = self.length-1 : num_elems = args[0]-1 # sets number of elements to be processed 

		if block_given?
			for i in (0..num_elems) do
				yield(self[i],i)
			end
		else # return a Enumeration with args elements	
			res =[]
			for i in (0..num_elems) do
				res << self[i] 
			end
			res.to_enum
		end	
		
	end
	
	def my_select
		arr_res = [] 

		if block_given?
			self.my_each do |item|
				if yield(item)	
						arr_res << item
				end
			end
		else #no block given, returns a Enumeration
			arr_res = self.to_enum
		end

		return(arr_res)
		
	end
	
	def my_all?
		res = true

		for i in (0..self.length-1) do 

			if self[i] == nil # to avoid possible errors during the block execution
				res = false
				break # no need to continue comparing

			elsif block_given?

				if !yield(self[i])
					res = false
					break
				end					
			end
		end
		
		return(res)	
	end
	
	def my_any?
		res = false

		for i in (0..self.length-1) do 

			if block_given?
				if yield(self[i])
					res = true
					break
				end			
			elsif self[i] # not false or nil
				res = true
				break	
			end
		end
		return(res)			
	end
	
	def my_none?
	
		if block_given?
			res = self.my_all? {|x| yield(x) == false}
		else
			res = self.my_all? {|x| x == false}
		end
		
		return res
	end
	
	def my_count(*item)

		if block_given? #a block was given to method
			res = self.my_select {|x| yield(x)}
		elsif !item.empty? #there is one parameter
			res = self.my_select {|x| x == item[0]}
		else 	
			res = self
		end
		
		return res.length	
	end
	
	def my_map(&code_block)
		
		if code_block #There is a Proc passed as parameter. Execute it!
			res = self.my_select {|x| code_block.call(x)}
		elsif block_given? # a block was given to the method
			res = self.my_select {|x| yield(x)}
		else #no Proc, no block. 
			res = self.my_select
		end
		
		return res
		
	end
	
	def my_inject(*args)

		args_size = args.length #get number of par
		arr_res = self.to_a #in case of self is a Enumeration

		if block_given?
				# if a initial value was passed with block, need to set memo.
				args_size == 0 ? memo = arr_res[0] : memo = args[0] #memo initial value 
				
				self.my_each {|item| memo = yield(memo,item)}

		elsif args_size == 1 #it is a symbol by method definition
				
				if args[0] == :+ #? memo = 0 : memo = 1 # sets initial memo value, that depends on the operation plus or multiply
					arr_res[0].is_a?(String) ? memo = "" : memo = 0
				else
					arr_res[0].class != arr_res[1].class ? memo = arr_res[0] : memo = 1				
				end
				
				arr_res.my_each {|item| memo = memo.method(args[0]).call item if item.is_a?(Integer) || (args[0] == :+)}

		elsif args_size == 2 #a initial value and a symbol as parameters
			memo = args[0]
			arr_res.my_each {|item| memo = memo.method(args[1]).call item}

		end
		
		return memo
	end
				
end	

def multiply_els(arr)
	arr.my_inject(:*)
end

# ============ TESTS  =========================	
a = ["a","b", "c",1,2, nil]

print "\n\n Testing my_each\n"
a.my_each {|x| print x, "--"}
	
print "\n\n Testing my_each_with_index \n"
a.my_each_with_index {|item, index| print index, "--"}

print "\n\n Testing my_each_with_index with args and block\n"
a.my_each_with_index(3) {|item, index| print index, "--"}

print "\n\n Testing my_each_with_index with args\n"
p a.my_each_with_index(2)

print "\n\n Testing my_select \n"
a = %w{ a b c d e f }
p a.my_select { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]
p a.my_select

print "\n\n Testing my_all \n"
p %w[ant bear cat].my_all? { |word| word.length >= 3 }

print "\n\n Testing my_any \n"
p %w[ant bear cat].my_any? { |word| word.length >= 4 }

print "\n\n Testing my_none \n"
p %w[ant bear cat].my_none? { |word| word.length == 3 }


print "\n\n Testing my_count\n"
ary = [1, 2, 4, 2]
p ary.count               #=> 4
p ary.count(2)            #=> 2
p ary.count{ |x| x%2==0 } #=> 3

print "\n\n Testing my_map \n"
p (1..4).map { |i| i*i }      #=> [1, 4, 9, 16]

print "\n\n Testing multiply and my_inject\n"
p multiply_els([1,2,3,4,])
p multiply_els((1..4))
p ["now",3].my_inject(:*)
p (5..10).my_inject { |sum, n| sum + n }  

p a.my_inject(:+)



