### File-name: sample-file-in-3.rb ###

File.open('sample-seq-1.fasta'){|file_name|
	file_name.each('A'){|line_data|	#s‚Ì––’[ or ‚»‚ê‚¼‚ê‚Ì['A']‚Ü‚Å“Ç‚İæ‚é
					#‚±‚±‚Å‚à[' ']‚Æ[" "]‚Ìˆá‚¢‚Í’ˆÓ

		line = line_data

		print(line, "\n")		#“Ç‚İ‚Æ‚Á‚½•”•ª‚Ü‚Å‚Å‰üs

	}
}