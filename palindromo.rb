def palindromo(frase)
  pal = frase[0] == frase[frase.length-1] 
  if pal
  	 pal = palindromo(frase.slice(1..frase.length-2)) if frase.length-1 > 0
  end	 
  return pal
end

if palindromo("aba") 
	puts 	"true"
else
	puts "false"

end