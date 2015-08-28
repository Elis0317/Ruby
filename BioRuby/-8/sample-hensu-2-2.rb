### File-name: sample-hensu-2-2.rb

dna_seq_1 = "ATGCGTTGATGAGAAGG"

def dna_1

	$dna_seq_2 = "atgcgttgatgagaagg"	# [$ ]はグローバル変数（どこからでも参照可）
	p $dna_seq_2
	
end

dna_1										#=>"atgcgttgatgagaagg"

$dna_seq_2 = dna_seq_1	# 2に1（大文字）を代入
												# メソッド内の変数だが、グローバル変数なので参照、代入できてしまう

p $dna_seq_2						#=>"ATGCGTTGATGAGAAGG"
												# 13行目、17行目の結果は異なってしまう