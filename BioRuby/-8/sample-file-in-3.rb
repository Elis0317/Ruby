### File-name: sample-file-in-3.rb ###

File.open('sample-seq-1.fasta'){|file_name|
	file_name.each('A'){|line_data|	#�s�̖��[ or ���ꂼ���['A']�܂œǂݎ��
					#�����ł�[' ']��[" "]�̈Ⴂ�͒���

		line = line_data

		print(line, "\n")		#�ǂ݂Ƃ��������܂łŉ��s

	}
}