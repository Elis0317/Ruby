#! ruby -Ks

###File-name: dna-res-map-2.rb
# 'strscan'��'gdbm'���Ăяo��
require 'strscan'
require 'gdbm'

### ���\�b�h��`
# �����y�f�̐ؒf�p�^�[���̐��K�\�����쐻���郁�\�b�h
# �����͐ؒf�p�^�[��
def make_cut_exp(cut_pat)
	sub_cha = {
		"A" => 'A',
		"C" => 'C',
		"G" => 'G',
		"T" => 'T',
		"R" => '[AG]',
		"Y" => '[CT]',
		"M" => '[AC]',
		"K" => '[GT]',
		"S" => '[GC]',
		"W" => '[AT]',
		"B" => '[CGT]',
		"D" => '[AGT]',
		"H" => '[ACT]',
		"V" => '[ACG]',
		"N" => '[ACGT]',
	}
	
	# �ؒf�p�^�[������"[^]"����菜���A1�������z���
	cut_pat_ex = cut_pat.sub("^", "")
	cut_pat_ex_arr = cut_pat_ex.split("")
	
		# ���K�\����ۑ�����ϐ���������
	cut_pat_ex_fin = ""
	
	cut_pat_ex_arr.each{|ch|							# �ǂݍ���DNA�̔z��
		sub_cha.each{|dna_ch, dna_ch_exp|		# ���K�\���̃L�[�ƃf�[�^
			if dna_ch == ch
				cut_pat_ex_fin << dna_ch_exp		
				break
			end
		}
	}
	#---------------------------
	# �ǂݍ���DNA�̔z�񂪃L�[�ƈ�v���Ă���ꍇ�A�f�[�^��Ԃ��B��������ꂼ��̔z��ŌJ��Ԃ��B
	# �Ԃ��ꂽ�������cut_pat_ex_fin�ɏ��Ԃɕ�����Ƃ��Č�������B
	#---------------------------
	return cut_pat_ex_fin
end

### ���C���v���O����
# �f�[�^�x�[�X�p�t�@�C�����쐬
db = GDBM.open('DB_BIONET')

# �����y�f�̃f�[�^�t�@�C�����J��
lib_file = File.open("link_bionet-dos.txt")

# ���͂��������y�f���Ńf�[�^�x�[�X������
# ARGV�͔z��̂悤�Ȃ��̂����A���͂���������z��̒��ɓ���邱�Ƃ��ł���
key_tmp = ARGV[0]
key = key_tmp.chomp

# �����y�f���ɑΉ������f�[�^���擾
fh = db[key]
if fh
	# �f�[�^�x�[�X�Ƀf�[�^�����݂��� =>�Ή�����f�[�^�K��
	lib_file.seek(fh.to_i, IO::SEEK_SET)
	line_res = lib_file.gets("\n")
else
	print("�Y�����鐧���y�f�͂���܂���\n")
	db.close
	lib_file.close
	exit!
end

db.close
lib_file.close

# FASTA�`���̍ŏ��̍s��ۑ�����ϐ��̏�����
fasta_name_1 = ""
# DNA�z���ۑ�����ϐ���������
dna_seq_1 = ""

# �t�@�C������f�[�^���擾(FASTA�`��)
File.open('dna-5-1.fasta'){|file_name|
	file_name.each{|line_data|
		if line_data =~ /^>/
			fasta_name_1 = line_data.chomp
		else
			dna_seq_1 << line_data.chomp
		end
	}
}

# �����y�f�̃f�[�^�𕪊�
res_name_exp_tmp = line_res.chomp.split("\s")

# �����y�f��
res_name = res_name_exp_tmp[0]

# �����y�f�̐ؒf�p�^�[��
cut_pat = res_name_exp_tmp[-1]

# �����y�f�̐ؒf�p�^�[���̐��K�\����
# ���\�b�hmake_cut_exp���g���č쐬
cut_exp = make_cut_exp(cut_pat)

s = StringScanner.new(dna_seq_1)

# �����y�f�̐ؒf�p�^�[���̐��K�\���Ƀ}�b�`����ʒu��ۑ�����z��
s_pos = []

# �����y�f�̐ؒf�p�^�[���̐��K�\���Ƀ}�b�`����ʒu���Ascan ���g�p���đS�Ď�肾��
# [/#{}/]�ɂ��A�ϐ��𐳋K�\���̒��ɓ��ꍞ�ނ��Ƃ��\
while s.scan_until(/#{cut_exp}/i)
	s_pos.push(s.pos)
end


# �����y�f�̔F�����ʂ��o�͂���u���b�N
print('�����y�f ', res_name, " �̔F�����ʂ�[ ", cut_pat, " ]�ł��B\n")

# �����y�f�̔F�����ʂ̒���
cut_pat_len = cut_pat.length

# s_pos�ɕۑ������F�����ʂ̈ʒu���o�͂���
if s_pos == []
	print(fasta_name_1, "�̒��ɐؒf�ł��镔�ʂ͂���܂���ł����B")
else
	s_pos.each{|position_1|
		position_2 = position_1 - cut_pat_len + 2
		print(fasta_name_1, "�� ", position_2, " �Ԗڂ���̉���ɊY�����܂��B\n")
	}
end
