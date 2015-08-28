#! ruby -Ks

### File_name: dna-res-map.rb ###

module DnaResMap
	
	require 'strscan'
	
	### ���\�b�h(1)
	# �����y�f�̃f�[�^���n�b�V���Ɋi�[���郁�\�b�h
	# �����͐����y�f�̃f�[�^���i�[����n�b�V���ƁA�ǂݎ����1�s���̃f�[�^
	def prs_rebase(res_data_hash, res_data)
		
		# �󂯎����1�s���̍y�f�f�[�^�𕪊�
		res_data_arr_temp = res_data.split("\s")
		
		# �����y�f�����擾
		res_name = res_data_arr_temp.shift
		
		# �����y�f�̐ؒf�p�^�[����ۑ�����ϐ�
		res_pat = ""
		
		# �ŏ��̐ؒf�p�^�[����ۑ�����ϐ�
		res_data_arr_temp.each{|data_tmp|
			
			if data_tmp !~ /^\(/	# [(]�Ŏn�܂�Ȃ��v�f���w��
				res_pat = data_tmp
			end
		}
		
		# �����y�f�����L�[�ɁA�ؒf�p�^�[�����f�[�^�ɕۑ�
		res_data_hash[res_name] = res_pat
		return res_data_hash
	end
	
	### ���\�b�h(2)
	# �����y�f�̐ؒf�p�^�[���̐��K�\�����쐬���郁�\�b�h
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

### ���\�b�h�i3�j
# DNA�z���ǂݍ��ݐ����y�f�n�}���o�͂��邽�߂̃��\�b�h
def dna_map_making(res_data_file, dna_data_file, out_file_1)
	File.open(out_file_1, 'w'){|out_file_name|
		
		#�����y�f�̃f�[�^���i�[����n�b�V��
		res_data_hash = Hash.new
		
		# �t�@�C�����琧���y�f�̃f�[�^���擾(REBASE�`��)
		File.open(res_data_file){|file_name|
			
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
		File.open(dna_data_file){|file_name|
			
			file_name.each{|line_data|
				
				# �ŏ��̍s��ۑ�
				if line_data =~ /^>/
					fasta_name_1 = line_data.chomp
					
				# DNA�z���ǉ�
				else
					dna_seq_1 << line_data.chomp #[<<] ������̘A��
				end
			}
		}
		
		# FASTA�`���̕\�������o��
		out_file_name.print(fasta_name_1, "�̐����y�f�n�}\n\n")
		
		# �n�b�V�� res_data_hash�̃L�[�ƃf�[�^���Aeach���g�p���đS�ČĂяo��
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
			
			# �����y�f�̔F�����ʂ��o�͂���u���b�N(���ʂ̌��h����ǂ����邽��)
			# rjust(10)�́u�E�l��17�����v�ɂ��郁�\�b�h
			out_file_name.print('�����y�f ', res_name.rjust(17), " �̔F�����ʂ́A\s")
			
			# �����y�f�̔F�����ʂ̒���
			cut_pat_len = cut_pat.length
			
			# s_pos �ɕۑ������F�����ʂ̈ʒu���o�͂���
			position_arr = []
			
			if s_pos == []
				out_file_name.print(fasta_name_1, " �̔z��̒��ɂ͂���܂���ł����B\n")
			else
				s_pos.each{|position_1|
					position_2 = position_1 - cut_pat_len + 2
					position_arr.push(position_2)
				}
				out_file_name.print(position_arr)
				out_file_name.print("�Ԗڂ̉���ł��B\n")
			end
			}
			print("�����y�f�n�}��͐����ł��I\n���ʂ�res_map_result.txt�ɏo�͂���Ă��܂��B\n")
		}
	end
	
	module_function :prs_rebase
	module_function :make_cut_exp
	module_function :dna_map_making
	
end