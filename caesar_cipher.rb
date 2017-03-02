def caesar_cipher(letter, shift)

	if letter =~ /\w/	
		result = letter.ord+shift
		if result > 122
			result = (result-122) + 96
		elsif result.between?(91,96) 
			result = (result-90) + 64
		elsif result.between?(58,64) #Dealing with Numbers
			result = (result - 57) + 47
		end
	else
		result = letter.ord
	end
	
	return result.chr
end

puts "Enter a phrase to cipher, please"
phrase_to_cipher =  gets.chomp
#
#ask for a shift factor. Limting the entry just for fun! 
shift_factor = 11
until shift_factor < 11
	puts "Enter your shift factor up to 10"
	shift_factor = gets.chomp.to_i
end

#//iterating the characters and shiftting them
new_phrase = ""
0.upto(phrase_to_cipher.length - 1) do |i|
	new_phrase [i] = caesar_cipher(phrase_to_cipher[i],shift_factor)
end

p new_phrase
