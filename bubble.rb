def bubble_sort(array)
	0.upto(array.length) do |iteration| #there's no need to scan all itens after first iteration
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
		0.upto(array.length) do 
			array.each_with_index do |item, index|
				if (yield(array[(index-1)],item) > 0)
					array[(index-1)], array[(index)] = item, array[(index-1)] 
				end	
			end
		end
	else
		puts "No block given"
		bubble_sort(array)
	end
	return(array)
end
puts bubble_sort_by(["hi","hello","hey","bola","hay"]) {|left,right| left.length - right.length}
puts bubble_sort([9,14,2,4,7,8,6])
