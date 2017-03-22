def bubble_sort(array)
	0.upto(array.length) do |iteration| #there's no need to scan all itens after prior iterations
		array.each_with_index do |item, index|
			if (index < (array.length-1 - iteration)) && (array[(index+1)] < item)
				array[index], array[(index+1)] = array[(index+1)], item
			end	
		end
	end
	return(array)
end

def bubble_sort_by(array)
	if block_given?		
		arr_size = array.length - 1
		for i in (0..arr_size) do 
			for j in (1..(arr_size -i)) do #no need do iter over all itens after prior iterations
				if (yield(array[(j-1)],array[j]) > 0)
					ind_aux = array[j-1]
					array[(j-1)], array[j] = array[j],ind_aux
				end	
			end
		end
	else
		puts "No block given"
		bubble_sort(array)
	end
	return(array)
end
puts bubble_sort_by(["hi","hello","567662","hey","bola","hay"]) {|left,right| left.length - right.length}
puts bubble_sort([9,14,2,4,7,8,6])
