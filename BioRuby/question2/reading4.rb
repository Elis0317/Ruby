def aa_rev(seq_1)
	trans_1 = seq_1.gsub('a', 'G')
	trans_2 = trans_1.gsub('g', 'A')
	trans_3 = trans_2.gsub('c', 'T')
	trans_4 = trans_3.gsub('t', 'C')
	trans_rev = trans_4.reverse.downcase
	
	return trans_rev
	
end

#-----------------------------
# ファイルの読み込み
#-----------------------------

# 変数の初期化
seq = ""
title = ""

File.open('dna-5-1.fasta') do |f|
	f.each{|line|
		if line =~ /^>/
			#-----------------------
			# 先頭の[>]の削除
			#-----------------------
			
			line_ch = line.chomp
			line_len = line_ch.length
			title << line_ch.slice(1..line_len-1)
			
			#-----------------------
			# [slice, slice!]の使い方
			# ()に削除したい文字の場所を代入することで、その文字列を削除する
			# [!]をつけると破壊メソッドに
			#
			#
			# 注意!戻り値は｢削除した文字｣を返す（削除して残った文字ではない)
			#
			#
			#-----------------------
			
		else
			seq << line.chomp
		end
	}
end

seq_rev = aa_rev(seq)
p seq_rev
