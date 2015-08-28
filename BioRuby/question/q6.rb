#! ruby -Ks
### File-name: q6.rb

#改行を除いた配列ファイルの作成
File.open('sample-out.txt', 'w'){|out_file_name|	
# 'w'は書き込みモード
# 指定したファイルがなければそのファイルを作成して書き込み、存在する場合は上書き
	
	text = File.read('C:\Users\Kubono\Desktop\ruby\-8\dna-5-1.txt')
	text_1 = text.gsub("\n", "")	# 改行を取り除く
	out_file_name.print(text_1)		# dna-5-1 のデータを sample-out.data に書き出し
}

#改行を除いた配列の文字数を取得
string = File.read('sample-out.txt')	# 元データから改行が取り除かれたものが読み込まれている

seq_num = string.length	# 文字数を取得 -> DNA配列の長さを取得

# DNA配列からのa, t, g, cの割合を分析

a_num = 0	# a, t, g, cそれぞれ文字数を格納する変数
t_num = 0	# 変数の初期化
g_num = 0
c_num = 0

string_2 = File.open('sample-out.txt')
# 変数string_2に、 [sample-out.data] の先頭を示すファイルポインタの値として、0が渡される
#（つまり、この時点でのポインタは、テキストファイルの一番左上で点滅している状態）

## p 'string_2.pos ='
## p string_2.pos <= 0

# forとポインタを使ってDNA配列をすべて読みとる
# iの始まりは0から
for i in 0..seq_num-1
	
	# ポインタをi+1番目の文字へ移動
	string_2.seek(i)	# [seek] ファイルの先頭から i-1 番目の文字に、ファイルポインタを移動する命令
	
	## p string_2.pos <= 0から（塩基数）-1までカウントが増えていく
	
	#1文字だけ配列を取得
	dna_w = string_2.read(1)	# 1文字だけ読み取る
	
	# DNAがaのとき
	if dna_w == 'a'
		a_num = a_num + 1
		
	elsif dna_w == 't'
		t_num = t_num + 1
		
	elsif dna_w == 'g'
		g_num = g_num + 1
		
	else
		c_num = c_num + 1	# cが最後に残る
	end
	
end

def percent(aa, aa_num, seq_num)
	# a,t,g,cの割合計算
	per = (aa_num.to_f / seq_num.to_f) * 100.0
	
	printf("DNA配列中の ")
	printf(aa)
	printf(" は、")
	printf("%5.1f", per)
	printf(" パーセントです。\n")
	
	
end

percent('a', a_num, seq_num)
percent('g', g_num, seq_num)
percent('t', t_num, seq_num)
percent('c', c_num, seq_num)
#-----------------------------
#[printf]は文字・数字（特に浮動小数点）の形式を整えて出力できるメソッド
#使い方は[printf(形式1, 形式2, ---, 出力1, 出力2, ---)
#
#形式は以下の通り
#
#["%8.3"f", 200.36] => " 200.360"
#8桁のうち3桁が小数点以下、右揃え

#["-%8.3"f", 200.36] => "200.360 "
#8桁のうち3桁が小数点以下、左揃え

#["%08.3"f", 200.36] => "0200.360"
#整数の上の桁を0で埋める
#
#["%8.1"f", 200.36] => " 200.4"
#小数点以下は指定した数に合わせて四捨五入
#
#["%+8.3"f", 200.36] => "+200.360"
#プラスマイナスを常につける
#-----------------------------