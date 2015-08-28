input = gets.chomp.split("\s")
a, b = input[0].to_i, input[1].to_i

until (a == 0) && (b == 0)
	if a > b
		print(b, " ", a, "\n")
	else
		print(a, " ", b, "\n")
	end
	
	input = gets.chomp.split("\s")
	a, b = input[0].to_i, input[1].to_i
end