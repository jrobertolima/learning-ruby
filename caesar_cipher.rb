def caesar_cipher(letter, shift)

	if letter =~ /[a-zA-Z0-9]/	
		result = letter.ord+shift
        if letter.ord.between?(65,90) && result > 90 # A-Z. Need rotation
            result = (result - 65)%26 + 65

        elsif  letter.ord.between?(97,122) && result > 122 #a-z. Need rotation
            result = (result - 97)%26 + 97		
		elsif letter =~ /\d/ && result > 57 #Dealing with Numbers and rotation
			result = ( result - 48)%10 + 48 
        else
            result = letter.ord + shift # no need to rotate
        end   		
	else
		result = letter.ord
	end
	
	result.chr
end

p "Enter a phrase to cipher, please"

phrase_to_cipher = gets.chomp

#ask for a shift factor. Limting the entry just for fun! 
shift_factor = 11

until shift_factor < 11
	p "Enter your shift factor up to 10"
	shift_factor = gets.chomp.to_i
end

#//iterating the characters and shiftting them
new_phrase = ""
0.upto(phrase_to_cipher.length - 1) do |i|
	new_phrase [i] = caesar_cipher(phrase_to_cipher[i],shift_factor)
end

puts new_phrase
