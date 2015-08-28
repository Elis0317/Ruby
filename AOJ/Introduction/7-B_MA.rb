# 判定関数
def judge(n, x)
	count = 0
	for a in 1..(x / 3 - 1)	# <=一番小さい数aの最大値は3で割った数から1引いたもの
		for b in (a + 1)..(n - 1) #bはaより大きくcより小さい
			c = x - a - b	
			
			if (c > b) && (c <= n)	#cがbより大きく、nを超えない場合
				count += 1
			end
		end
	end
	
return count
end

# 値の入力
imput = gets.chomp.split("\s")
n, x = imput[0].to_i, imput[1].to_i

# 判定と出力
until (n == 0) && (x == 0)
	puts judge(n, x)
	imput = gets.chomp.split("\s")
	n, x = imput[0].to_i, imput[1].to_i
end