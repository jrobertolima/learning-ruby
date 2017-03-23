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
		self.my_each {|x| yield}		
	
	end
end	
	
	puts [1,2,3,4].my_select {|x| x.even?}
	
	