### File-name: q11.rb ###

hairetsu_1 = ['abc', 'def', 'ghi', 'jkl', 'mno', 'pqr', 'stu', 'vwx', 'yz']

def pri(arr_1, int)
	arr_2 = arr_1[int]
	print(arr_2, "\n")
end

pri(hairetsu_1, 1)
pri(hairetsu_1, 2)
pri(hairetsu_1, 0)
pri(hairetsu_1, -1)