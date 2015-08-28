#! ruby -Ks

#-----------------------------
# 問5 数当てゲーム
# コンピュータの考えた4ケタの数字を当てる。
# 数字は1-9で、同じ数字は使用できない。
#-----------------------------

# ゲームオーバーになる入力回数を指定
GameOver = 2

def ran
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr_ran = arr.shuffle

	return arr_ran	# ランダムな配列を返し、そのうち[0]-[3]のみを使う
end

num_arr = ran
num = 1000 * num_arr[0] + 100 * num_arr[1] + 10 * num_arr[2] + num_arr[3]
# p num #<= 正解が見える

# 入力された数字を格納する配列を作成
insert_arr = Array.new(4)

# 実際の入力と処理
insert = gets.chomp.to_i
	print("あなたの入力した数字は、", insert, " ですね。\n")
p insert

insert_0 = insert / 1000
insert_arr[0] = insert_0
insert_n = insert - 1000 * insert_0

insert_1 = insert_n / 100
insert_arr[1] = insert_1
insert_n = insert_n - 100 * insert_1

insert_2 = insert_n / 10
insert_arr[2] = insert_2
insert_n = insert_n - 10 * insert_2

insert_3 = insert_n
insert_arr[3] = insert_3

p insert_arr
# 数字を入力した回数を表示
kaisu = 1
	print("これは、", kaisu, " 回目の数当てです。\n")

until insert == num
	### 判定プログラム
	hit = 0
	blow = 0
	
	for j in 0..3
		# Blowの確認
		if (insert_arr[j] == num_arr[0]) || (insert_arr[j] == num_arr[1]) || (insert_arr[j] == num_arr[2]) || (insert_arr[j] == num_arr[3]) 
		
			# Blowのうち、Hitかどうかを判定
			if insert_arr[j] == num_arr[j]
				hit = hit + 1
				
			else
				blow = blow + 1
			end
		
		# HitでもBlowでもなければ何もしない
		end
	end
	
	
	print("\nHit...", hit, "!!\n")
	print("Blow...", blow, "!\n")
	
	# 2回目以降の入力
	
	for i in 0..3
		print( i+1, "番目の数字を入力して、Returnを押してください\n")
		insert_arr[i] = gets.chomp.to_i
	end
	
	insert = 1000 * insert_arr[0] + 100 * insert_arr[1] + 10 * insert_arr[2] + insert_arr[3]
	print("あなたの入力した数字は、", insert, " ですね。\n")
	
	# 入力した回数を増やす
	kaisu = kaisu + 1
	print("これは、", kaisu, " 回目の数当てです。\n")
	
	# 規定回数以上入力したらゲームオーバー
	if kaisu >= GameOver
		print("\n入力が", GameOver, "回を超えましたが、あなたは正解にたどり着けませんでした。\n")
		print("正解は、", num, "でした。\n")
		print("Game Over...\n")
		break
	end
	
end

if kaisu < GameOver
	print("Clear!!")
end