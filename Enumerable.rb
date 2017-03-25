module Enumerable

	def my_each

		arr_res = self.to_a
		if block_given?
			for i in (0..arr_res.length-1) do
				yield(arr_res[i])
			end
		else
			arr_res.to_enum
		end
	end
	
	def my_each_with_index
		if block_given?
			for i in (0..self.length-1) do
				yield(self[i],i)
			end
		else	
			self.to_enum
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
			return(arr_res)
		else
			self.to_enum
		end
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
		
		if code_block #There is a Proc passed as parameter
			res = self.my_select {|x| code_block.call(x)}
		elsif block_given? # a block was given to the method
			res = self.my_select {|x| yield(x)}
		else
			res = self.my_select
		end
		
		return res
		
	end
	
	def my_inject(*args)

		args_size = args.length #get number of par
		arr_res = self.to_a #in case of self is a Enumeration

		if block_given?
				args_size == 0 ? memo = arr_res[0] : memo = args[0] #memo initial value 
				
				self.my_each {|item| memo = yield(memo,item)}

		elsif args_size == 1 #it is a symbol by method definition
				
				if args[0] == :+ #? memo = 0 : memo = 1 # sets initial memo value, that depends on the operation plus or multiply
					arr_res[0].is_a?(String) ? memo = "" : memo = 0
				else
					arr_res[0].class != arr_res[1].class ? memo = arr_res[0] : memo = 1				
				end
				
				arr_res.my_each {|item| memo = memo.method(args[0]).call item if item.is_a?(Integer) || (args[0] == :+)}

		elsif args_size == 2
			memo = args[0]
			arr_res.my_each {|item| memo = memo.method(args[1]).call item}

		end
		
		return memo
	end
				
end	

def multiply_els(arr)
	arr.my_inject(:*)
end
	

# p ["ab",2].my_inject(:*)
p multiply_els(["3",2])

	