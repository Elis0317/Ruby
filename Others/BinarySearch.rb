#二分探索
def bsearch(x, buff) #true or falseを返す
#x には数値を、buffには小さい順に数字が並べられた配列番号を格納

	#データを抽出する場所を決定
	#初期条件では[0..-1]を指定
	low = 0
	high = buff.size - 1
  
	while low <= high
		mid = (low + high) / 2	#配列番号の中央値を計算
		
		if x == buff[mid]		#探したい数字xと配列番号の中央値の要素が等しいか?
			return true
		elsif x > buff[mid]		#xが配列番号の中央値の要素より大きい場合
			low = mid + 1		#xが存在する可能性は配列番号の中央値より右側
						#(x != 配列番号の中央値の要素)より、lowを配列番号の中央値の1つ右にする
		else
			high = mid - 1		#小さい場合は逆の処理
		end
	end
	false	#return は省略可能
end

#テスト
#if  __FILE__ == $0, end
#直接実行した時は呼ばれるが、require（モジュールなどのロード）の際は読み込まれない
if __FILE__ == $0
	a = (1 ... 5).to_a #<= [1, 2, 3, 4]
	for x in [0, 1, 2.5, 3, 4, 5]
		print x, " ", bsearch(x, a), "\n"  
	end
end