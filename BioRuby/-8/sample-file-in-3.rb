### File-name: sample-file-in-3.rb ###

File.open('sample-seq-1.fasta'){|file_name|
	file_name.each('A'){|line_data|	#行の末端 or それぞれの['A']まで読み取る
					#ここでも[' ']と[" "]の違いは注意

		line = line_data

		print(line, "\n")		#読みとった部分までで改行

	}
}