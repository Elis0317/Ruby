#! ruby -Ks

### File-name: q3.rb ###

print("文字を入力してReturnを押してください。\n")
ge_1 = gets
ge_2 = ge_1.chomp	# 入力した文字は\nがついているため、それを削除して検索

File.open('C:\Users\Kubono\Desktop\ruby\dna-program\dna-5-1.fasta'){|file_name|
	file_name.each(ge_2){|line_data|
		line = line_data

		print(line, "\n")
	}
}