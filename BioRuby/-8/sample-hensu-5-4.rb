### File-name: sample-hensu-5-4.rb
# True -> number (0, 17 ---) False -> nil

text_seq = "ATGCGTTGATGAGAAGGATGCATGCATGC"

print('Pattern_1 =', "\n")
p text_seq =~ /ATGC+ATGC/	# [+]は前の文字を1回以上繰り返すときに使う正規表現

# [=~（チルダ）]は、正規表現に当てはまるパターンが存在するかを確かめる記号
# マッチするパターンが存在し、その初めの文字がn文字目の時、n-1を返す。
# ないときは nil を返す。

print('Pattern_2 =', "\n")
p text_seq =~ /(ATGC){2}/	#[ATGC]が2回繰り返されるときに使う正規表現

print('Pattern_3 =', "\n")
p text_seq =~ /(ATGC){2,}/	#[ATGC]が2回以上繰り返されるときに使う正規表現