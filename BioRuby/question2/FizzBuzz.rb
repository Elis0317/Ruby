#------------------------------
# 問2 FizzBuzz
#
#ルールは以下の通り
#
# 1から順番に数を表示する
# その数が3で割り切れるなら"Fizz"、5で割り切れるなら"Buzz"、両方で割り切れるなら"FizzBuzz"と表示する
#
# すなわち、"1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz ･･･"と、100("Buzz")まで出力されるプログラムを作りなさい。
#-----------------------------

for i in 1..100
	if i % 15 == 0
		print("FizzBuzz\s")
		
	elsif i % 3 == 0
		print("Fizz\s")
		
	elsif i % 5 == 0
		print("Buzz\s")
		
	else
		print(i, "\s")
	
	end
end