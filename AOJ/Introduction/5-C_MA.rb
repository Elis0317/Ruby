#縦、横の数値を受け取る
input = gets.chomp.split("\s")
h, w = input[0].to_i, input[1].to_i

#出力
def output(h, w)
	arr = []
	
	#入力する文字数
	for i in 1..w
	  #高さで分ける
		if h % 2 == 0
		  
		  #偶数行の処理
		  #偶数文字目は[#], 奇数文字目は[.]
			if i % 2 == 0
				arr = arr + ["#"]
				out = arr.join
			else
				arr = arr + ["."]
				out = arr.join
			end
			
		else
		  #奇数行の処理
		  #偶数文字目は[.], 奇数文字目は[#]
			if i % 2 == 0
				arr = arr + ["."]
				out = arr.join
			else
				arr = arr + ["#"]
				out = arr.join
			end
			
		end
	end
return out end

#0 0で入力終了
until (h == 0) && (w == 0)
  #各行出力させる
	for i in 1..h
		out = output(i, w)
	puts out
	end
	
  #最終行は1行開けるよう指定	
  puts ""

  #値の取りなおし
  input = gets.chomp.split("\s")
  h, w = input[0].to_i, input[1].to_i
end