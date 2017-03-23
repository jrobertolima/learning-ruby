module Enumerable

	def my_each
		if block_given?
			for i in (0..self.length-1) do
				yield(self[i])
			end
		else
			self.to_enum
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
			res = my_all? {|x| yield(x) == false}
		else
			res = my_all? {|x| x == false}
		end
		
		return res
	end
	
	def my_count(*item)
		if block_given?
			res = my_select {|x| yield(x)}
		elsif !item.empty?
			res = my_select {|x| x == item[0]}
		else	
			res = self
		end
		
		return res.length	
	end
	
	def my_map
		
	end
	
	def my_inject
	
	end
end	
	
p [1,2,3,-2, 0,5,3].my_count # {|x| x > 1}
	
	