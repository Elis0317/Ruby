### File-name: sample-hensu-2-2.rb

dna_seq_1 = "ATGCGTTGATGAGAAGG"

def dna_1

	$dna_seq_2 = "atgcgttgatgagaagg"	# [$ ]�̓O���[�o���ϐ��i�ǂ�����ł��Q�Ɖj
	p $dna_seq_2
	
end

dna_1										#=>"atgcgttgatgagaagg"

$dna_seq_2 = dna_seq_1	# 2��1�i�啶���j����
												# ���\�b�h���̕ϐ������A�O���[�o���ϐ��Ȃ̂ŎQ�ƁA����ł��Ă��܂�

p $dna_seq_2						#=>"ATGCGTTGATGAGAAGG"
												# 13�s�ځA17�s�ڂ̌��ʂ͈قȂ��Ă��܂�