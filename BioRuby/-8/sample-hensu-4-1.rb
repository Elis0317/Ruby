#! ruby -Ks

### File-name: sample-hensu-4-1.rb

File.open('sample-seq-2.txt'){|file_name|
	len_text = 0
	
	file_name.each{|line|
		
		print(line)
		
		len_text = len_text + line.chomp.length
		# ------------------------
		# [len_text]に文字の量を一行ずつ格納
		# [line]に文字列を格納 => [chomp]で最後の改行を削除 => [length]で文字列の代わりにその長さを格納
		# 14行目ではそれぞれの行の長さを合計している
		# ------------------------
	}
	print("\n", len_text, "文字\n")
	
}