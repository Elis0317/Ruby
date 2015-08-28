#! ruby -Ks

### File-name: dna-aa.rb ###
# モジュール定義
module Dna2AA_make
	
	# メソッド定義
	# DNAからアミノ酸への翻訳（メソッド1）
	# コドンの配列 codon を引数として受け取る
	def dna2aa_1(codon)
		
		aa = ''
		
		if codon =~ /GC./i								# Alanine
			aa = 'A'												# [/i[(正規表現の大文字・小文字を区別しない)
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
			aa = 'L'												# [|]正規表現で「または」
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
		
		# 翻訳されるアミノ酸名を探す
		return aa
		
	end
	
	
	# 読み枠の繰り返し(メソッド2)
	# DNA配列dna_seqと読み枠 i を引数として受け取る
	def codon_while(dna_seq, i)
	
		aa_seq = []
		
		#読み枠の3文字目(dna_seq[i+2]がなくなるまで処理を繰り返す
		while dna_seq[i+2]
			
			# DNA配列3文字分を取得
			codon = dna_seq[i] + dna_seq[i+1]+ dna_seq[i+2]
			
			# メソッドdna2aa_1を呼び出し
			aa = dna2aa_1(codon)
			
			#翻訳したアミノ酸名を配列に追加
			aa_seq.push(aa)
			
			#3文字分iを移動
			i = i + 3
			
		end
		
		#翻訳したアミノ酸を返す
		return aa_seq
		
	end
	
	### DNA配列を読み込み翻訳結果を出力するメソッド（メソッド3）
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
			
			# FASTA形式の表示名を出力
			out_file_name.print(fasta_name_1, " のアミノ酸配列\n")
			
			# DNAデータを配列dna_hairetsu_1へ代入
			dna_hairetsu_1 = dna_seq_1.split("")	#1文字ずつ配列に代入
			
			#読み枠1の翻訳語を出力(塩基配列の1文字目から読み始める)
			aa_seq_1 = codon_while(dna_hairetsu_1, 0)
			aa_seq_str_1 = aa_seq_1.join('')	#配列を仕切りなしでつなげる
			out_file_name.print('aa_seq_1 = ', "\n")
			out_file_name.print(aa_seq_str_1, "\n")
			
			#読み枠2の翻訳語を出力(塩基配列の2文字目から読み始める)
			aa_seq_2 = codon_while(dna_hairetsu_1, 1)
			aa_seq_str_2 = aa_seq_2.join('')	
			out_file_name.print('aa_seq_2 = ', "\n")
			out_file_name.print(aa_seq_str_2, "\n")
			
			#読み枠3の翻訳語を出力(塩基配列の3文字目から読み始める)
			aa_seq_3 = codon_while(dna_hairetsu_1, 2)
			aa_seq_str_3 = aa_seq_3.join('')	
			out_file_name.print('aa_seq_3 = ', "\n")
			out_file_name.print(aa_seq_str_3, "\n")
			
			print("塩基配列翻訳成功です！\n結果はdna2aa_result.txtに出力されています。\n")
		}
	end
	
	module_function :dna2aa_1
	module_function :codon_while
	module_function :dna_file_for_aa

end
