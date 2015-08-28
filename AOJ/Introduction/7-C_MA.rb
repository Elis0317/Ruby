# 入力
imput = gets.chomp.split("\s")
r, c = imput[0].to_i, imput[1].to_i

# 答えを記憶する配列
ans_arr = Array.new(r){ Array.new(c, 0) }

# 配列への入力
for i in 0..r - 1
	arr = gets.chomp.split("\s")
	for j in 0.. c - 1
	
		for k in 0..c - 1
			arr[k] = arr[k].to_i
		end
		
	ans_arr[i][j] = arr[j]
	end
end

# 横の計算
for p in 0..r - 1
	sum = 0
	for q in 0..c - 1
		sum += ans_arr[p][q]
	end
	ans_arr[p] += [sum]
	
end

# 縦の計算
arr_sum = Array.new(c + 1, 0)
for t in 0..c
	sum = 0
	
	for s in 0..r - 1
		sum += ans_arr[s][t]
	end
	arr_sum[t] = sum
end

# 一番下の行をドッキング
ans_arr << arr_sum

# 出力
for h in 0..r
	puts ans_arr[h].join("\s")
end