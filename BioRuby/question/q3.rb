#! ruby -Ks

### File-name: q3.rb ###

print("��������͂���Return�������Ă��������B\n")
ge_1 = gets
ge_2 = ge_1.chomp	# ���͂���������\n�����Ă��邽�߁A������폜���Č���

File.open('C:\Users\Kubono\Desktop\ruby\dna-program\dna-5-1.fasta'){|file_name|
	file_name.each(ge_2){|line_data|
		line = line_data

		print(line, "\n")
	}
}