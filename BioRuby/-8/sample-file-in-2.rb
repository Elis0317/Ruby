### File-name: sample-file-in-2.rb ###

File.open('sample-seq-1.fasta'){|file_name|
	file_name.each{|line_data|
		line = line_data		#line_data�ɂ͊e�s�̃f�[�^���i�[
		
		print(line, "\n") 		#1�s���Ɠǂ܂�Ă���̂�������悤�ɁA�����Ė��s���s
	}
}

