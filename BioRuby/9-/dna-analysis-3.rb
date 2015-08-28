#! ruby -Ks
### File-name: dna-analysis-3.rb

### ���\�b�h��`
# DNA��͂̌��ʂ��o�͂��邽�߂̃��\�b�h
def result(word, dna_num, dna_sum)
	
	dna_per = (dna_num.to_f / dna_sum.to_f) * 100.0
	
	printf("DNA�z�񒆂� ")
	printf(word)
	printf(" �́A")
	printf("%5.1f", dna_per)
	printf(" �p�[�Z���g�ł��B\n")
	
end

### ���C���v���O����

# FASTA�`���̍ŏ��̍s��ێ�����ϐ���������
fasta_name_1 = ""

# DNA�z���ۑ�����ϐ���������
dna_seq_1 = ""

# �t�@�C������f�[�^���擾(FASTA�`��)
File.open('dna-5-1.fasta'){|file_name|

	file_name.each{|line_data|
		if line_data =~ /^>/
			fasta_name_1 = line_data.chomp		# �ŏ��̍s�����s�������ĕۑ�
		
		else
			dna_seq_1 << line_data.chomp			# DNA�z������s�������ĕۑ�
		end
	}
}

# DNA�f�[�^��z��dna_hairetsu_1�֑��
dna_hairetsu_1 = dna_seq_1.split("")

# DNA�z��̒������擾
seq_num = dna_hairetsu_1.size

# DNA�z�񂩂��a, t, g, c�̊����𕪐�

a_num = 0	# a, t, g, c���ꂼ�ꕶ�������i�[����ϐ�
t_num = 0	# �ϐ��̏�����
g_num = 0
c_num = 0

# each���g�p����DNA�z������ׂēǂ݂Ƃ�
dna_hairetsu_1.each{|dna_w|
	
	if dna_w == 'a'
		a_num = a_num + 1
		
	elsif dna_w == 't'
		t_num = t_num + 1
		
	elsif dna_w == 'g'
		g_num = g_num + 1
		
	else
		c_num = c_num + 1
	end
}

# FASTA�`���̕\�����𒊏o
fasta_name_2 = fasta_name_1.sub(/^>/, '')

# DNA�z��̒�����\��
print(fasta_name_2, '�̔z�� = ', seq_num, "\n")

# a, t, g, c�̊������v�Z�A�\��
result('a', a_num, seq_num)
result('g', g_num, seq_num)
result('c', c_num, seq_num)
result('t', t_num, seq_num)
