### File-name: sample-file-in-2.rb ###

File.open('sample-seq-1.fasta'){|file_name|
	file_name.each{|line_data|
		line = line_data		#line_dataには各行のデータが格納
		
		print(line, "\n") 		#1行ごと読まれているのが分かるように、あえて毎行改行
	}
}

