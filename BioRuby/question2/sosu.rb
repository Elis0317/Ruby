#-----------------------------
# 問3 素数
# 10000までの素数を列挙しなさい。
#-----------------------------

#-----------------------------
# 素数は2から10000まで
# 2からiの中に、約数がいくつあるかを判定する
# 約数が1つなら素数
#-----------------------------

yk = 0
set = 100

for i in 4..7
	for j in 2..i
		if i % j == 0
			yk = yk + 1
		end
		
		if yk == 1
			num_ok = i
		else
			num_ok = ""
		end
	end
	
	if num_ok != ""
		print(num_ok)
		#else
		#print("NO...")
	end
	
end