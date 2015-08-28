#! ruby -Ks
### File-name: dna-analysis-3.rb

### メソッド定義
# DNA解析の結果を出力するためのメソッド
def result(word, dna_num, dna_sum)
	
	dna_per = (dna_num.to_f / dna_sum.to_f) * 100.0
	
	printf("DNA配列中の ")
	printf(word)
	printf(" は、")
	printf("%5.1f", dna_per)
	printf(" パーセントです。\n")
	
end

### メインプログラム

# FASTA形式の最初の行を保持する変数を初期化
fasta_name_1 = ""

# DNA配列を保存する変数を初期化
dna_seq_1 = ""

# ファイルからデータを取得(FASTA形式)
File.open('dna-5-1.fasta'){|file_name|

	file_name.each{|line_data|
		if line_data =~ /^>/
			fasta_name_1 = line_data.chomp		# 最初の行を改行を除いて保存
		
		else
			dna_seq_1 << line_data.chomp			# DNA配列を改行を除いて保存
		end
	}
}

# DNAデータを配列dna_hairetsu_1へ代入
dna_hairetsu_1 = dna_seq_1.split("")

# DNA配列の長さを取得
seq_num = dna_hairetsu_1.size

# DNA配列からのa, t, g, cの割合を分析

a_num = 0	# a, t, g, cそれぞれ文字数を格納する変数
t_num = 0	# 変数の初期化
g_num = 0
c_num = 0

# eachを使用してDNA配列をすべて読みとる
dna_hairetsu_1.each{|dna_w|
	
	if dna_w == 'a'
		a_num = a_num + 1
		
	elsif dna_w == 't'
		t_num = t_num + 1
		
	elsif dna_w == 'g'
		g_num = g_num + 1
		
	else
		c_num = c_num + 1
	end
}

# FASTA形式の表示名を抽出
fasta_name_2 = fasta_name_1.sub(/^>/, '')

# DNA配列の長さを表示
print(fasta_name_2, 'の配列長 = ', seq_num, "\n")

# a, t, g, cの割合を計算、表示
result('a', a_num, seq_num)
result('g', g_num, seq_num)
result('c', c_num, seq_num)
result('t', t_num, seq_num)
