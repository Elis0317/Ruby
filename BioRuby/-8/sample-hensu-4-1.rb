#! ruby -Ks

### File-name: sample-hensu-4-1.rb

File.open('sample-seq-2.txt'){|file_name|
	len_text = 0
	
	file_name.each{|line|
		
		print(line)
		
		len_text = len_text + line.chomp.length
		# ------------------------
		# [len_text]�ɕ����̗ʂ���s���i�[
		# [line]�ɕ�������i�[ => [chomp]�ōŌ�̉��s���폜 => [length]�ŕ�����̑���ɂ��̒������i�[
		# 14�s�ڂł͂��ꂼ��̍s�̒��������v���Ă���
		# ------------------------
	}
	print("\n", len_text, "����\n")
	
}