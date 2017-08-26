def merge_final(resl, resr, res)
  posl = posr = pos = 0

  while posl < resl.size && posr < resr.size

  	if resl[posl] <= resr[posr]
  		res[pos] = resl[posl]
  		posl += 1
  	else	 
  		res[pos] = resr[posr]
  		posr += 1
  	end
  	pos += 1
  end

  if posl == resl.size
  	res[pos..res.size] = resr[posr..resr.size]
  else
  	res[pos..res.size] = resl[posl..resl.size]
  end

  res
end


def merge(list)
	n = list.size
  resl = resr = []
  posl = posr = pos = 0
	
	if n > 1
		resl = merge(list[0..n/2-1])
		resr = merge(list[n/2..n-1])
 		list = merge_final(resl,resr, list)
  else	
    list
  end	 
 
end

p merge([4,3,2,0,12,24,10,2,5,1,6,9,8,16])
