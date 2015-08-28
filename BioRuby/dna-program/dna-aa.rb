#! ruby -Ks

### File-name: dna-aa.rb ###
# ���W���[����`
module Dna2AA_make
	
	# ���\�b�h��`
	# DNA����A�~�m�_�ւ̖|��i���\�b�h1�j
	# �R�h���̔z�� codon �������Ƃ��Ď󂯎��
	def dna2aa_1(codon)
		
		aa = ''
		
		if codon =~ /GC./i								# Alanine
			aa = 'A'												# [/i[(���K�\���̑啶���E����������ʂ��Ȃ�)
		elsif codon =~ /TG[TC]/i					# Cysteine
			aa = 'C'
		elsif codon =~ /GA[TC]/i					# Aspartic Acid
			aa = 'D'
		elsif codon =~ /GA[AG]/i					# Glutamic Acid
			aa = 'E'
		elsif codon =~ /TT[TC]/i					# Phenylalanine
			aa = 'F'
		elsif codon =~ /GG./i							# Glycine
			aa = 'G'
		elsif codon =~ /CA[TC]/i					# Histidine
			aa = 'H'
		elsif codon =~ /AT[TCA]/i					# Isoleucine
			aa = 'I'
		elsif codon =~ /AA[AG]/i					# Lysine
			aa = 'K'
		elsif codon =~ /TT[AG]|CT./i			# Leucine
			aa = 'L'												# [|]���K�\���Łu�܂��́v
		elsif codon =~ /ATG/i							# Methionine
			aa = 'M'
		elsif codon =~ /AA[TC]/i					# Asparagine
			aa = 'N'
		elsif codon =~ /CC./i							# Proline
			aa = 'P'
		elsif codon =~ /CA[AG]/i					# Glutamine
			aa = 'Q'
		elsif codon =~ /CG.|AG[AG]/i			# Arginine
			aa = 'R'
		elsif codon =~ /TC.|AG[TC]/i			# Serine
			aa = 'S'
		elsif codon =~ /AC./i							# Threonine
			aa = 'T'
		elsif codon =~ /GT./i							# Valine
			aa = 'V'
		elsif codon =~ /TGG/i							# Tryptophan
			aa = 'W'
		elsif codon =~ /TA[TC]/i					# Tyrosine
			aa = 'Y'
		elsif codon =~ /TA[AG]|TGA/i			# Stop
			aa = '_'
		else															# Error
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
	
	### DNA�z���ǂݍ��ݖ|�󌋉ʂ��o�͂��郁�\�b�h�i���\�b�h3�j
	def dna_file_for_aa(file_name_in, out_file_2)
		
		File.open(out_file_2, 'w'){|out_file_name|
			
			fasta_name_1 = ""
			
			dna_seq_1 = ""
			
			File.open(file_name_in){|file_name|
				
				file_name.each{|line_data|
					
					if line_data =~ /^>/
						fasta_name_1 = line_data.chomp
						
					else
						dna_seq_1 << line_data.chomp
					end
				}
			}
			
			# FASTA�`���̕\�������o��
			out_file_name.print(fasta_name_1, " �̃A�~�m�_�z��\n")
			
			# DNA�f�[�^��z��dna_hairetsu_1�֑��
			dna_hairetsu_1 = dna_seq_1.split("")	#1�������z��ɑ��
			
			#�ǂݘg1�̖|�����o��(����z���1�����ڂ���ǂݎn�߂�)
			aa_seq_1 = codon_while(dna_hairetsu_1, 0)
			aa_seq_str_1 = aa_seq_1.join('')	#�z����d�؂�Ȃ��łȂ���
			out_file_name.print('aa_seq_1 = ', "\n")
			out_file_name.print(aa_seq_str_1, "\n")
			
			#�ǂݘg2�̖|�����o��(����z���2�����ڂ���ǂݎn�߂�)
			aa_seq_2 = codon_while(dna_hairetsu_1, 1)
			aa_seq_str_2 = aa_seq_2.join('')	
			out_file_name.print('aa_seq_2 = ', "\n")
			out_file_name.print(aa_seq_str_2, "\n")
			
			#�ǂݘg3�̖|�����o��(����z���3�����ڂ���ǂݎn�߂�)
			aa_seq_3 = codon_while(dna_hairetsu_1, 2)
			aa_seq_str_3 = aa_seq_3.join('')	
			out_file_name.print('aa_seq_3 = ', "\n")
			out_file_name.print(aa_seq_str_3, "\n")
			
			print("����z��|�󐬌��ł��I\n���ʂ�dna2aa_result.txt�ɏo�͂���Ă��܂��B\n")
		}
	end
	
	module_function :dna2aa_1
	module_function :codon_while
	module_function :dna_file_for_aa

end
