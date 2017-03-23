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
end	
	
p [1,2,3,4].my_select {|x| x.even?}
	
	