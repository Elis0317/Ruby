seq = ""
fasta = ""

File.open('dna-5-1.fasta') do |f|
	f.each{|ln|
		if ln  =~ /^>/
			fasta = ln.chomp
		else
			seq << ln.chomp
		end
	}
end

p fasta