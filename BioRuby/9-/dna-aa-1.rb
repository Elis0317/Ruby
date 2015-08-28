### File-name: dna-aa-1.rb

### ���\�b�h��`

# DNA����A�~�m�_�ւ̖|��(���\�b�h1)
# �R�h���̔z��codon�������Ƃ��Ď󂯎��
def dna2aa_1(codon)

	aa = ''
	
	if codon =~ /GC./i						# Alanine
		aa = 'A'										# [/i[(���K�\���̑啶���E����������ʂ��Ȃ�)
	elsif codon =~ /TG[TC]/i			# Cysteine
		aa = 'C'
	elsif codon =~ /GA[TC]/i			# Aspartic Acid
		aa = 'D'
	elsif codon =~ /GA[AG]/i			# Glutamic Acid
		aa = 'E'
	elsif codon =~ /TT[TC]/i			# Phenylalanine
		aa = 'F'
	elsif codon =~ /GG./i			# Glycine
		aa = 'G'
	elsif codon =~ /CA[TC]/i			# Histidine
		aa = 'H'
	elsif codon =~ /AT[TCA]/i			# Isoleucine
		aa = 'I'
	elsif codon =~ /AA[AG]/i			# Lysine
		aa = 'K'
	elsif codon =~ /TT[AG]|CT./i			# Leucine
		aa = 'L'										# [|]���K�\���Łu�܂��́v
	elsif codon =~ /ATG/i			# Methionine
		aa = 'M'
	elsif codon =~ /AA[TC]/i			# Asparagine
		aa = 'N'
	elsif codon =~ /CC./i			# Proline
		aa = 'P'
	elsif codon =~ /CA[AG]/i			# Glutamine
		aa = 'Q'
	elsif codon =~ /CG.|AG[AG]/i			# Arginine
		aa = 'R'
	elsif codon =~ /TC.|AG[TC]/i			# Serine
		aa = 'S'
	elsif codon =~ /AC./i			# Threonine
		aa = 'T'
	elsif codon =~ /GT./i			# Valine
		aa = 'V'
	elsif codon =~ /TGG/i			# Tryptophan
		aa = 'W'
	elsif codon =~ /TA[TC]/i			# Tyrosine
		aa = 'Y'
	elsif codon =~ /TA[AG]|TGA/i			# Stop
		aa = '_'
	else													# Error
		print("BAD codon ", codon, " !!\n")
	end
	
	# �|�󂳂��A�~�m�_����T��
	return aa

end


# �ǂݘg�̌J��Ԃ�(���\�b�h2)
# DNA�z��dna_seq�Ɠǂݘg i �������Ƃ��Ď󂯎��
def codon_while(dna_seq, i)

	aa_seq = []
	
	#�ǂݘg��3������(dna_seq[i+2]���Ȃ��Ȃ�܂ŏ������J��Ԃ�
	while dna_seq[i+2]
	
		# DNA�z��3���������擾
		codon = dna_seq[i] + dna_seq[i+1]+ dna_seq[i+2]
		
		# ���\�b�hdna2aa_1���Ăяo��
		aa = dna2aa_1(codon)
		
		#�|�󂵂��A�~�m�_����z��ɒǉ�
		aa_seq.push(aa)
		
		#3������i���ړ�
		i = i + 3
		
	end
	
	#�|�󂵂��A�~�m�_��Ԃ�
	return aa_seq
	
end


### ���C���v���O����

# �t�@�C������f�[�^���擾
text = File.read('dna-5-1.txt')

# ���s���������z��f�[�^�̍쐬
text_1 = text.gsub("\n", "")

# DNA�f�[�^��z��dna_hairetsu_1�֑��
dna_hairetsu_1 = text_1.split("")	#1�������z��ɑ��

#�ǂݘg1�̖|�����o��(����z���1�����ڂ���ǂݎn�߂�)
aa_seq_1 = codon_while(dna_hairetsu_1, 0)
aa_seq_str_1 = aa_seq_1.join('')	#�z����d�؂�Ȃ��łȂ���
print('aa_seq_1 = ', "\n")
print(aa_seq_str_1, "\n")

#�ǂݘg2�̖|�����o��(����z���2�����ڂ���ǂݎn�߂�)
aa_seq_2 = codon_while(dna_hairetsu_1, 1)
aa_seq_str_2 = aa_seq_2.join('')	
print('aa_seq_2 = ', "\n")
print(aa_seq_str_2, "\n")

#�ǂݘg3�̖|�����o��(����z���3�����ڂ���ǂݎn�߂�)
aa_seq_3 = codon_while(dna_hairetsu_1, 2)
aa_seq_str_3 = aa_seq_3.join('')	
print('aa_seq_3 = ', "\n")
print(aa_seq_str_3, "\n")

#-----------------------------
# def codon_while
# dna_seq�i1�������z��ɓ�����DNA = dna_hairetsu*�j, i(����z���ǂݎn�߂�ꏊ)��2�������Ɏ��A
# 3�����ǂ��codon���쐻�Adna2aa�ŃA�~�m�_�ɕϊ��Aaa_seq�i�A�~�m�_1�����ō\�����ꂽ�z��j�Ɋi�[
# dna_seq������ȏ�ǂ߂Ȃ��Ȃ�����Aaa_seq�i�ǂݏI����1�����z���Ԃ��j
#
# ���̌�͌ʂɔz���A���A�����񉻂��Ă���
#
# 	def dna2aa_1
# 	codon�i[atgc]3�j�������Ɏ��A���K�z�񂩂�A�~�m�_�𔻒��Aaa(�A�~�m�_1����)�ɕԂ�
#-----------------------------
