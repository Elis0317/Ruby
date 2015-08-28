#標準入力
N = gets.chomp.to_i

#解答を入れる配列
ans_arr = Array.new

#数字の中に3があるかどうかを判別
def exist3(int)
	int_len = int.to_s.length
	flag = false

	for k in 0..int_len - 1
	key = int_len - 1 - k

		if int / (10 ** key) == 3 
			flag = true
			break
		else int -= (int / (10 ** key)) * (10 ** key)	#前半の()で一番大きな位の桁が得られる

		end
	end
return flag
end	

#カウント
for i in 1..N
	if exist3(i)
		ans_arr += [i]
	elsif i % 3 == 0
		ans_arr += [i]
	elsif i % 10 == 3
		ans_arr += [i]
	end
end
print("\s", ans_arr.join("\s"), "\n")