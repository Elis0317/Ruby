#! ruby -Ks
### File-name: dna-analysis-1.rb

#���s���������z��t�@�C���̍쐬
File.open('sample-out.txt', 'w'){|out_file_name|	
# 'w'�͏������݃��[�h
# �w�肵���t�@�C�����Ȃ���΂��̃t�@�C�����쐬���ď������݁A���݂���ꍇ�͏㏑��
	
	text = File.read('dna-5-1.txt')
	text_1 = text.gsub("\n", "")	# ���s����菜��
	out_file_name.print(text_1)		# dna-5-1 �̃f�[�^�� sample-out.data �ɏ����o��
}

#���s���������z��̕��������擾
string = File.read('sample-out.txt')	# ���f�[�^������s����菜���ꂽ���̂��ǂݍ��܂�Ă���

seq_num = string.length	# ���������擾 -> DNA�z��̒������擾

# DNA�z�񂩂��a, t, g, c�̊����𕪐�

a_num = 0	# a, t, g, c���ꂼ�ꕶ�������i�[����ϐ�
t_num = 0	# �ϐ��̏�����
g_num = 0
c_num = 0

string_2 = File.open('sample-out.txt')
# �ϐ�string_2�ɁA [sample-out.data] �̐擪�������t�@�C���|�C���^�̒l�Ƃ��āA0���n�����
#�i�܂�A���̎��_�ł̃|�C���^�́A�e�L�X�g�t�@�C���̈�ԍ���œ_�ł��Ă����ԁj

## p 'string_2.pos ='
## p string_2.pos <= 0

# for�ƃ|�C���^���g����DNA�z������ׂēǂ݂Ƃ�
# i�̎n�܂��0����
for i in 0..seq_num-1
	
	# �|�C���^��i+1�Ԗڂ̕����ֈړ�
	string_2.seek(i)	# [seek] �t�@�C���̐擪���� i-1 �Ԗڂ̕����ɁA�t�@�C���|�C���^���ړ����閽��
	
	## p string_2.pos <= 0����i����j-1�܂ŃJ�E���g�������Ă���
	
	#1���������z����擾
	dna_w = string_2.read(1)	# 1���������ǂݎ��
	
	# DNA��a�̂Ƃ�
	if dna_w == 'a'
		a_num = a_num + 1
		
	elsif dna_w == 't'
		t_num = t_num + 1
		
	elsif dna_w == 'g'
		g_num = g_num + 1
		
	else
		c_num = c_num + 1	# c���Ō�Ɏc��
	end
	
end
# a,t,g,c�̊����v�Z
a_per = (a_num.to_f / seq_num.to_f) * 100.0
t_per = (t_num.to_f / seq_num.to_f) * 100.0
g_per = (g_num.to_f / seq_num.to_f) * 100.0
c_per = (c_num.to_f / seq_num.to_f) * 100.0

# DNA�z�񒆂�a, t, g, c�̊��������\��
# printf�ɂ�镂�������_�\���ɒ���
printf('DNA�z�񒆂� a �̊����́A ')
printf("%5.1f", a_per)
printf(' �p�[�Z���g�ł��B', "\n")

printf('DNA�z�񒆂� t �̊����́A ')
printf("%5.1f", t_per)
printf(' �p�[�Z���g�ł��B', "\n")

printf('DNA�z�񒆂� g �̊����́A ')
printf("%5.1f", g_per)
printf(' �p�[�Z���g�ł��B', "\n") #<=�Ȃ������Ɂ���u���ƃG���[�ɂȂ�̂��H

printf('DNA�z�񒆂� c �̊����́A ')
printf("%5.1f", c_per)
printf(' �p�[�Z���g�ł��B', "\n")

#-----------------------------
#[printf]�͕����E�����i���ɕ��������_�j�̌`���𐮂��ďo�͂ł��郁�\�b�h
#�g������[printf(�`��1, �`��2, ---, �o��1, �o��2, ---)
#
#�`���͈ȉ��̒ʂ�
#
#["%8.3"f", 200.36] => " 200.360"
#8���̂���3���������_�ȉ��A�E����

#["-%8.3"f", 200.36] => "200.360 "
#8���̂���3���������_�ȉ��A������

#["%08.3"f", 200.36] => "0200.360"
#�����̏�̌���0�Ŗ��߂�
#
#["%8.1"f", 200.36] => " 200.4"
#�����_�ȉ��͎w�肵�����ɍ��킹�Ďl�̌ܓ�
#
#["%+8.3"f", 200.36] => "+200.360"
#�v���X�}�C�i�X����ɂ���
#-----------------------------