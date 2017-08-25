def fib(n)
	if n == 0
		res = 0
	elsif n == 1
		res = 1
	else
      res = fib(n-1) + fib(n-2) 
	end
	return res
end
#puts fib(ARGV[0].to_i)

def flattens(a, jah)
  if jah
    res = ""
  else
    res = []
  end 
  
  if a.is_a? Array
    a.each do |elem| 
	  if elem.is_a? Array
	     elem.each do |sub_elem|
		    if sub_elem.is_a? Array
		       res << flattens(sub_elem,true).ord
			else
               res << sub_elem
			end   
		 end
	  else
	    res << elem
   	  end
    end	  
  else
    res << a
  end
  return res
end
p flattens( [2,[1, 8,[7,6], 9], [3,[0,1,[2,3], 4]]], false)