### File-name: dna-aa-1.rb

### メソッド定義

# DNAからアミノ酸への翻訳(メソッド1)
# コドンの配列codonを引数として受け取る
def dna2aa_1(codon)

	aa = ''
	
	if codon =~ /GC./i						# Alanine
		aa = 'A'										# [/i[(正規表現の大文字・小文字を区別しない)
	elsif codon =~ /TG[TC]/i			# Cysteine
		aa = 'C'
	elsif codon =~ /GA[TC]/i			# Aspartic Acid
		aa = 'D'
	elsif codon =~ /GA[AG]/i			# Glutamic Acid
		aa = 'E'
	elsif codon =~ /TT[TC]/i			# Phenylalanine
		aa = 'F'
	elsif codon =~ /GG./i			# Glycine
		aa = 'G'
	elsif codon =~ /CA[TC]/i			# Histidine
		aa = 'H'
	elsif codon =~ /AT[TCA]/i			# Isoleucine
		aa = 'I'
	elsif codon =~ /AA[AG]/i			# Lysine
		aa = 'K'
	elsif codon =~ /TT[AG]|CT./i			# Leucine
		aa = 'L'										# [|]正規表現で「または」
	elsif codon =~ /ATG/i			# Methionine
		aa = 'M'
	elsif codon =~ /AA[TC]/i			# Asparagine
		aa = 'N'
	elsif codon =~ /CC./i			# Proline
		aa = 'P'
	elsif codon =~ /CA[AG]/i			# Glutamine
		aa = 'Q'
	elsif codon =~ /CG.|AG[AG]/i			# Arginine
		aa = 'R'
	elsif codon =~ /TC.|AG[TC]/i			# Serine
		aa = 'S'
	elsif codon =~ /AC./i			# Threonine
		aa = 'T'
	elsif codon =~ /GT./i			# Valine
		aa = 'V'
	elsif codon =~ /TGG/i			# Tryptophan
		aa = 'W'
	elsif codon =~ /TA[TC]/i			# Tyrosine
		aa = 'Y'
	elsif codon =~ /TA[AG]|TGA/i			# Stop
		aa = '_'
	else													# Error
		print("BAD codon ", codon, " !!\n")
	end
	
	# 翻訳されるアミノ酸名を探す
	return aa

end


# 読み枠の繰り返し(メソッド2)
# DNA配列dna_seqと読み枠 i を引数として受け取る
def codon_while(dna_seq, i)

	aa_seq = []
	
	#読み枠の3文字目(dna_seq[i+2]がなくなるまで処理を繰り返す
	while dna_seq[i+2]
	
		# DNA配列3文字分を取得
		codon = dna_seq[i] + dna_seq[i+1]+ dna_seq[i+2]
		
		# メソッドdna2aa_1を呼び出し
		aa = dna2aa_1(codon)
		
		#翻訳したアミノ酸名を配列に追加
		aa_seq.push(aa)
		
		#3文字分iを移動
		i = i + 3
		
	end
	
	#翻訳したアミノ酸を返す
	return aa_seq
	
end


### メインプログラム

# ファイルからデータを取得
text = File.read('dna-5-1.txt')

# 改行を除いた配列データの作成
text_1 = text.gsub("\n", "")

# DNAデータを配列dna_hairetsu_1へ代入
dna_hairetsu_1 = text_1.split("")	#1文字ずつ配列に代入

#読み枠1の翻訳語を出力(塩基配列の1文字目から読み始める)
aa_seq_1 = codon_while(dna_hairetsu_1, 0)
aa_seq_str_1 = aa_seq_1.join('')	#配列を仕切りなしでつなげる
print('aa_seq_1 = ', "\n")
print(aa_seq_str_1, "\n")

#読み枠2の翻訳語を出力(塩基配列の2文字目から読み始める)
aa_seq_2 = codon_while(dna_hairetsu_1, 1)
aa_seq_str_2 = aa_seq_2.join('')	
print('aa_seq_2 = ', "\n")
print(aa_seq_str_2, "\n")

#読み枠3の翻訳語を出力(塩基配列の3文字目から読み始める)
aa_seq_3 = codon_while(dna_hairetsu_1, 2)
aa_seq_str_3 = aa_seq_3.join('')	
print('aa_seq_3 = ', "\n")
print(aa_seq_str_3, "\n")

#-----------------------------
# def codon_while
# dna_seq（1文字ずつ配列に入ったDNA = dna_hairetsu*）, i(塩基配列を読み始める場所)の2つを引数に取り、
# 3文字読んでcodonを作製、dna2aaでアミノ酸に変換、aa_seq（アミノ酸1文字で構成された配列）に格納
# dna_seqがこれ以上読めなくなったら、aa_seq（読み終えた1文字配列を返す）
#
# その後は個別に配列を連結、文字列化している
#
# 	def dna2aa_1
# 	codon（[atgc]3）を引数に取り、正規配列からアミノ酸を判定後、aa(アミノ酸1文字)に返す
#-----------------------------
