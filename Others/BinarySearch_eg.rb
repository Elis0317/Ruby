#f(x) = x + 100sin(xπ)のとき、 f(x) = 1000となるxを一つ求めなさい。
# ただし、f(x)は小数第1位を四捨五入した時の値とする。

#f(x)は連続であるから、中間値の定理より
#f(a) < 1000 , f (b) > 1000 ,a < x < b のとき f(x) = 1000となる解が少なくとも1つ存在する

#Mathモジュールの読み込み
#これを行わない場合、Math:PIなど絶対パスを指定する
include Math

#計算式
def formula(int)
	answer = int + 100 * sin(int * PI)	#<= sinはラジアン単位で指定
	return answer.round
end

def bsearch
 	low, high = 0, 10000 # 適当に10000を指定
 	
 	while low <= high
 		mid = (low + high) / 2
 		if formula(mid) == 1000
 			return mid
 		elsif formula(mid) < 1000	#<= 1000より小さい時、解は右側
 						# e.g. ... 356, [457], 482, 504 ... 1000 ...
 			low = mid + 1
 		else
 			high = mid - 1
 		end
 	end
false	#なかった場合はFalseを返す
end

#解答
puts bsearch