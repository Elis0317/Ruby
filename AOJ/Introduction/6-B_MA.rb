#カードごとの配列の作成
spade, heart, daia, club = Array.new(13, "NG"), Array.new(13, "NG"), Array.new(13, "NG"), Array.new(13, "NG")

#カードの枚数
N = gets.chomp.to_i

#何が足りないか
def unknown(arr)
	ans_arr = Array.new
	for i in 0..12
		if arr[i] == "NG"
			ans_arr +=  [i]
		end
	end
	return ans_arr
end

#存在するカード
for i in 1..N
	card = gets.chomp.split("\s")
	number = card[1].to_i - 1

	case card[0]
		when "S"
			spade[number] = "OK"
		when "H"
			heart[number] = "OK"
		when "C"
			club[number] = "OK"
		else
			daia[number] = "OK"
	end
end

#出力
def output(arr, suit)
	#配列の要素を調べる
	arr_int = arr.length
	
	for k in 0..arr_int - 1
		print(suit, "\s", arr[k] + 1, "\n")
	end
end

#出力
s_unknown = unknown(spade)
output(s_unknown, "S")

h_unknown = unknown(heart)
output(h_unknown, "H")

c_unknown = unknown(club)
output(c_unknown, "C")

d_unknown = unknown(daia)
output(d_unknown, "D")