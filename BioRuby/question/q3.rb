#! ruby -Ks

### File-name: q3.rb ###

print("•¶š‚ğ“ü—Í‚µ‚ÄReturn‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B\n")
ge_1 = gets
ge_2 = ge_1.chomp	# “ü—Í‚µ‚½•¶š‚Í\n‚ª‚Â‚¢‚Ä‚¢‚é‚½‚ßA‚»‚ê‚ğíœ‚µ‚ÄŒŸõ

File.open('C:\Users\Kubono\Desktop\ruby\dna-program\dna-5-1.fasta'){|file_name|
	file_name.each(ge_2){|line_data|
		line = line_data

		print(line, "\n")
	}
}