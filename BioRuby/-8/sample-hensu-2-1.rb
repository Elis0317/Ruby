### File-name: sample-hensu-2-1.rb

dna_seq_1 = "ATGCGTTGATGAGAAGG"

def dna_1 #メソッドの定義開始
	dna_seq_2 = "atgcgttgatgagaagg"
	
	p dna_seq_2
end	#メソッドの定義終了

dna_1	#メソッドの呼び出し（実行）

p dna_seq_1

# p dna_seq_2 <= エラー
# メソッドの範囲外でdna_seq_2を呼び出しているため