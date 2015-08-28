#! ruby -Ks

### File-name: dna-res-map-1.rb ###

#-----------------------------
# ��{�I�ȗ���
#
# 1. �����y�f�̃f�[�^���n�b�V���Ɋi�[(�L�[:�����y�f��, �f�[�^:�ؒf�p�^�[���j
# 2. DNA�z����t�@�C������ǂݎ��
# 3. �ؒf�p�^�[���𐳋K�\���ɕϊ�
# 4. ���K�\���ɕϊ����������y�f�̐ؒf�p�^�[����DNA�z����ƍ����A�ؒf���ʂ����
# 5. �����y�f�̐ؒf���ʂ��o��
#-----------------------------

require 'strscan'
#-----------------------------
# [require '()']�͓����v���O������ɂȂ����\�b�h���g�p���邽�߂̋L�q���@
# ()�ɂ̓��\�b�h���L�q����Ă���v���O���������L�q�A�g���q[.rb]�͏ȗ��\
#
# strscan��Ruby�ŗp�ӂ��Ă������
# ���K�\���̃}�b�`����ʒu�𑀍삷��[StringScanner�N���X]�̃��\�b�h�𗘗p�ł���悤�ɂȂ�
#-----------------------------

### ���\�b�h��`

#-----------------------------
# �����y�f�̃f�[�^���n�b�V��[res_data_hash]�Ɋi�[���郁�\�b�h
# �����͐����y�f�̃f�[�^���i�[����n�b�V��[res_data_hash(new)]�ƁA�ǂݎ����1�s���̃f�[�^[line_data.chomp]
#-----------------------------

def prs_rebase(res_data_hash, res_data)
	
	#---------------------------
	# ���̃��\�b�h���Ă΂ꂽ���A�t�@�C�����琧���y�f�̃f�[�^���ǂ����𔻒f => True �̏��
	# ����āA�󂯎����1�s���̍y�f�f�[�^�𐧌��y�f���Ɛؒf�p�^�[���ɕ������Ă���
	#---------------------------
	
	res_data_arr_temp = res_data.split("\s")
	
	# �����y�f�����擾
	res_name = res_data_arr_temp.shift	# [shift]�͔z��̐擪����f�[�^�����o��
																			# �����ł͐����y�f�e�L�X�g�̐擪����̕�����A���Ȃ킿�����y�f���ɂȂ�
	
	# �����y�f�̐ؒf�p�^�[����ۑ�����ϐ�
	res_pat = ""
	
	# �ŏ��̃p�^�[����ۑ�
	res_data_arr_temp.each{|data_tmp|
		
		# ����:( �Ŏn�܂�Ȃ��v�f
		# (�����y�f�̌��f�[�^�ɂ�[AciI CCGC (-3/-1)]�̂悤�ɁA()���t�����f�[�^������̂ł�����������Ă���)
		if data_tmp !~ /^\(/
			res_pat = data_tmp
		end
		
	}
	
	# �����y�f�����L�[�ɁA�ؒf�p�^�[�����f�[�^�ɕۑ�
	res_data_hash[res_name] = res_pat
	
	# �����y�f�̃f�[�^��ۑ������n�b�V����Ԃ�
	return res_data_hash
	
end


# �����y�f�̐ؒf�p�^�[���̐��K�\�����쐻���郁�\�b�h
# �����͐ؒf�p�^�[��
def make_cut_exp(cut_pat)

	# �ؒf�p�^�[���𐳋K�\���ɕς��邽�߂̃n�b�V��
	sub_cha = {		# sub_cha�Ƃ����n�b�V�����쐬���A["(�L�[)"]��['(�f�[�^)']����[=>]
		
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
	
	# �ؒf�p�^�[������"[^]"����菜��
	cut_pat_ex = cut_pat.sub("^", "")
	
	# �ؒf�p�^�[����1�������z��֕���
	cut_pat_ex_arr = cut_pat_ex.split("")
	
	# ���K�\����ۑ�����ϐ���������
	cut_pat_ex_fin = ""
	
	# �ؒf�p�^�[����1���������K�\���ɕς���
	cut_pat_ex_arr.each{|ch|
		
		# �n�b�V�� sub_cha�̃L�[�ƃf�[�^���Ăяo��
		sub_cha.each{|dna_ch, dna_ch_exp|
			
			# �n�b�V�� sub_cha�̃L�[��
			# �ؒf�p�^�[���̕�����������
			if dna_ch == ch
			
				#���K�\����ǉ����Ă���
				cut_pat_ex_fin << dna_ch_exp
				break
			end
		}
	}
	
	# �ؒf���ʂ̐��K�\����Ԃ�
	return cut_pat_ex_fin

end


### ���C���v���O����

#�����y�f�̃f�[�^���i�[����n�b�V��
res_data_hash = Hash.new

# �t�@�C�����琧���y�f�̃f�[�^���擾(REBASE�`��)
File.open('link_proto.txt'){|file_name|

	file_name.each{|line_data|
	
		# �����y�f�̃f�[�^���Ȃ��s�͎g�p���Ȃ�
		if line_data =~ /^[\s\t\n]/ or line_data =~ /^REBASE/ or line_data =~ /^Rich Roberts/
		
		#-------------------------
		# ���f�[�^��1������[^]��[\s](�X�y�[�X) or [\t](�^�u) or [\n](���s)���ǂ����Ŕ��f
		# True�Ȃ琧���y�f�łȂ��Ɣ��f(�L�q�Ȃ�), �������A�^�C�g���ƍ�Җ���1�����ڂɂ���̂ŁA����͏��O
		#-------------------------
		
		else
			#�����y�f�̃f�[�^���n�b�V�� res_data_hash �ɒǉ�
			res_data_hash = prs_rebase(res_data_hash, line_data.chomp)
		end
	}
}


# FASTA�`���̍ŏ��̍s��ۑ�����ϐ���������
fasta_name_1 = ""

# DNA�z���ۑ�����ϐ���������
dna_seq_1 = ""

#�t�@�C������f�[�^���擾(FASTA�`��)
File.open('dna-5-1.fasta'){|file_name|
	
	file_name.each{|line_data|
		
		# �ŏ��̍s��ۑ�
		if line_data =~ /^>/
			fasta_name_1 = line_data.chomp
			break
		# DNA�z���ǉ�
		else
			dna_seq_1 << line_data.chomp #[<<] ������̘A��
		end
		
		#-------------------------
		#FASTA�`���͂��̂悤�Ȋ���
		#
		#>sp|P78426|NKX61_HUMAN Homeobox protein Nkx-6.1
		#MLAVGAMEGTRQSAFLLSSPPLAALHSMAEMKTPLYPAAYPPLPAGP...
		#
		#��s�ڂ�[>]�ł͂��܂�A�ǂ�DNA�̔z�񂩂��ڂ��Ă���
		#��s�ڈȍ~�͉���z�񂪗���
		#-------------------------
	}
}

# �n�b�V�� res_data_hash�̃L�[�ƃf�[�^��
# each���g�p���đS�ČĂяo��
# res_name: �L�[, cut_pat: �f�[�^
res_data_hash.each{|res_name, cut_pat|
	
	# �����y�f�̐ؒf�p�^�[���̐��K�\����
	# ���\�b�hmake_cut_exp���g���č쐬
	cut_exp = make_cut_exp(cut_pat)
	
	# StringScanner�N���X�̃I�u�W�F�N�g���쐬
	# ��Ő���
	s = StringScanner.new(dna_seq_1)
	
	# �����y�f�̐ؒf�p�^�[���̐��K�\����
	# �}�b�`����ʒu��ۑ�����z��
	s_pos = []
	
	# �����y�f�̐ؒf�p�^�[���̐��K�\���Ƀ}�b�`����ʒu��
	# scan ���g�p���đS�Ď�肾��
	while s.scan_until(/#{cut_exp}/i)
		#���K�\���Ƀ}�b�`����ʒu��ǉ�
		s_pos.push(s.pos)
	end
	
	# �����y�f�̔F�����ʂ��o�͂���u���b�N
	print('�����y�f ', res_name, " �̔F�����ʂ�: ")
	
	# �����y�f�̔F�����ʂ̒���
	cut_pat_len = cut_pat.length
	
	# s_pos �ɕۑ������F�����ʂ̈ʒu���o�͂���
	s_pos.each{|position_1|
	
		# scan�͐��K�\���Ƀ}�b�`����F�����ʂ̈�ԍŌ�̈ʒu��Ԃ����\�b�h�Ȃ̂ŁA
		# DNA�z��̒��ł̈ʒu�͈ȉ��̂悤�ɂȂ�
		position_2 = position_1 - cut_pat_len + 2
		print(position_2, "������\s")
	}

	print("\n")

}
