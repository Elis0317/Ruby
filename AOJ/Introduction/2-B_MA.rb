def inout (place, line, r)
	flag = true
	#���W�̍�or��
	place_min = place - r
	if place_min < 0
		flag = false
	end
	
	#���W�̉Eo��
	place_max = place + r
	if place_max > line
		flag = false
	end
	return flag
end

#input
nyuryoku= gets.chomp.split("\s")

W = nyuryoku[0].to_i	#���̕ӏC���������c
H = nyuryoku[1].to_i
x = nyuryoku[2].to_i
y = nyuryoku[3].to_i
r = nyuryoku[4].to_i

if inout(x, W, r)
	if inout(y, H, r)
		puts "Yes"
	else
		puts "No"
	end
	
else
	puts "No"
end