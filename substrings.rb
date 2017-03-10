# Verifies how many ocurrencies of a substring there are in a string
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string_to_compare,dictionary)
	string_to_compare_to_arr = string_to_compare.downcase.split(" ") # Convert string in array of downcased words

	hash_result = Hash.new(0)
	
	dictionary.each do |word| #Gets each word of the dictionary and compares to array of words

		string_to_compare_to_arr.each do |word_of_string_to_compare| 

			if word_of_string_to_compare[word]			
					hash_result[word] += 1 
			end #if	

		end #each
	end #each

	return hash_result
end #def
  
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
 