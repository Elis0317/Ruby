#! ruby -Ks

#-----------------------------
# 問4 ユークリッドの互除法
# 数字が二つ与えられた時、その最大公約数を求めなさい。
#-----------------------------

print("1つ目の数字を入力してください。\n")
a = gets.chomp.to_i

print("2つ目の数字を入力してください。\n")
b = gets.chomp.to_i

if a > b	# aとbの大小関係 
	x = a
	y = b
else
	x = b
	y = a
end

#-----------------------------
# ユーグリッドの互除法
# 大きいほうを小さいほうで割り、余りが0でなければ小さいほうを余りで割る。
# これを繰り返し余りが0の時、その時の小さいほうが最大公約数である。
#-----------------------------
while x % y != 0
	d = x % y
	x = y
	y = d
end

print(a, "\sと\s", b, "\sの最大公約数は\s", y, "\sです。")
