def aa_rev(seq_1)
	trans_1 = seq_1.gsub('a', 'G')
	trans_2 = trans_1.gsub('g', 'A')
	trans_3 = trans_2.gsub('c', 'T')
	trans_4 = trans_3.gsub('t', 'C')
	trans_rev = trans_4.reverse.downcase
	
	return trans_rev
	
end

#-----------------------------
# �t�@�C���̓ǂݍ���
#-----------------------------

# �ϐ��̏�����
seq = ""
title = ""

File.open('dna-5-1.fasta') do |f|
	f.each{|line|
		if line =~ /^>/
			#-----------------------
			# �擪��[>]�̍폜
			#-----------------------
			
			line_ch = line.chomp
			line_len = line_ch.length
			title << line_ch.slice(1..line_len-1)
			
			#-----------------------
			# [slice, slice!]�̎g����
			# ()�ɍ폜�����������̏ꏊ�������邱�ƂŁA���̕�������폜����
			# [!]������Ɣj�󃁃\�b�h��
			#
			#
			# ����!�߂�l�͢�폜�����������Ԃ��i�폜���Ďc���������ł͂Ȃ�)
			#
			#
			#-----------------------
			
		else
			seq << line.chomp
		end
	}
end

seq_rev = aa_rev(seq)
p seq_rev
