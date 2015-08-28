seq = ""
title = ""

File.open('dna-5-1.fasta') do |f|
	f.each{|ln|
		if ln =~ /^>/
			ln_ch = ln.chomp
			ln_len = ln_ch.length
			title = ln_ch.slice(1..ln_len-1)
		else
			seq << ln.chomp
		end
	}
end

seq_arr = seq.split("")
seq_sz = seq.size

wd_a = 0
wd_g = 0
wd_t = 0
wd_c = 0

for i in 0..seq_sz-1
	str = seq_arr[i]
	case str
		when "a"
			wd_a = wd_a + 1
			
		when "g"
			wd_g = wd_g + 1
			
		when "c"
			wd_c = wd_c + 1
			
		when "t"
			wd_t = wd_t + 1
			
	end
end

per_a = wd_a / seq_sz
per_g = wd_g / seq_sz
per_c = wd_c / seq_sz
per_t = wd_t / seq_sz
