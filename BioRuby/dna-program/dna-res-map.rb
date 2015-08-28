#! ruby -Ks

### File_name: dna-res-map.rb ###

module DnaResMap
	
	require 'strscan'
	
	### メソッド(1)
	# 制限酵素のデータをハッシュに格納するメソッド
	# 引数は制限酵素のデータを格納するハッシュと、読み取った1行分のデータ
	def prs_rebase(res_data_hash, res_data)
		
		# 受け取った1行分の酵素データを分割
		res_data_arr_temp = res_data.split("\s")
		
		# 制限酵素名を取得
		res_name = res_data_arr_temp.shift
		
		# 制限酵素の切断パターンを保存する変数
		res_pat = ""
		
		# 最初の切断パターンを保存する変数
		res_data_arr_temp.each{|data_tmp|
			
			if data_tmp !~ /^\(/	# [(]で始まらない要素を指定
				res_pat = data_tmp
			end
		}
		
		# 制限酵素名をキーに、切断パターンをデータに保存
		res_data_hash[res_name] = res_pat
		return res_data_hash
	end
	
	### メソッド(2)
	# 制限酵素の切断パターンの正規表現を作成するメソッド
	# 引数は切断パターン
	def make_cut_exp(cut_pat)

	# 切断パターンを正規表現に変えるためのハッシュ
	sub_cha = {		# sub_chaというハッシュを作成し、["(キー)"]に['(データ)']を代入[=>]
		
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
	
	# 切断パターンから"[^]"を取り除く
	cut_pat_ex = cut_pat.sub("^", "")
	
	# 切断パターンを1文字ずつ配列へ分解
	cut_pat_ex_arr = cut_pat_ex.split("")
	
	# 正規表現を保存する変数を初期化
	cut_pat_ex_fin = ""
	
	# 切断パターンを1文字ずつ正規表現に変える
	cut_pat_ex_arr.each{|ch|
		
		# ハッシュ sub_chaのキーとデータを呼び出す
		sub_cha.each{|dna_ch, dna_ch_exp|
			
			# ハッシュ sub_chaのキーと
			# 切断パターンの文字が同じ時
			if dna_ch == ch
			
				#正規表現を追加していく
				cut_pat_ex_fin << dna_ch_exp
				break
			end
		}
	}
	
	# 切断部位の正規表現を返す
	return cut_pat_ex_fin

end

### メソッド（3）
# DNA配列を読み込み制限酵素地図を出力するためのメソッド
def dna_map_making(res_data_file, dna_data_file, out_file_1)
	File.open(out_file_1, 'w'){|out_file_name|
		
		#制限酵素のデータを格納するハッシュ
		res_data_hash = Hash.new
		
		# ファイルから制限酵素のデータを取得(REBASE形式)
		File.open(res_data_file){|file_name|
			
			file_name.each{|line_data|
				
				# 制限酵素のデータがない行は使用しない
				if line_data =~ /^[\s\t\n]/ or line_data =~ /^REBASE/ or line_data =~ /^Rich Roberts/
				
				#-------------------------
				# 元データの1文字目[^]が[\s](スペース) or [\t](タブ) or [\n](改行)かどうかで判断
				# Trueなら制限酵素でないと判断(記述なし), ただし、タイトルと作者名も1文字目にあるので、それは除外
				#-------------------------
			
				else
					#制限酵素のデータをハッシュ res_data_hash に追加
					res_data_hash = prs_rebase(res_data_hash, line_data.chomp)
				end
			}
		}
		
		
		# FASTA形式の最初の行を保存する変数を初期化
		fasta_name_1 = ""
		
		# DNA配列を保存する変数を初期化
		dna_seq_1 = ""
		
		#ファイルからデータを取得(FASTA形式)
		File.open(dna_data_file){|file_name|
			
			file_name.each{|line_data|
				
				# 最初の行を保存
				if line_data =~ /^>/
					fasta_name_1 = line_data.chomp
					
				# DNA配列を追加
				else
					dna_seq_1 << line_data.chomp #[<<] 文字列の連結
				end
			}
		}
		
		# FASTA形式の表示名を出力
		out_file_name.print(fasta_name_1, "の制限酵素地図\n\n")
		
		# ハッシュ res_data_hashのキーとデータを、eachを使用して全て呼び出す
		# res_name: キー, cut_pat: データ
		res_data_hash.each{|res_name, cut_pat|
			
			# 制限酵素の切断パターンの正規表現を
			# メソッドmake_cut_expを使って作成
			cut_exp = make_cut_exp(cut_pat)
			
			# StringScannerクラスのオブジェクトを作成
			# 後で説明
			s = StringScanner.new(dna_seq_1)
			
			# 制限酵素の切断パターンの正規表現に
			# マッチする位置を保存する配列
			s_pos = []
			
			# 制限酵素の切断パターンの正規表現にマッチする位置を
			# scan を使用して全て取りだす
			while s.scan_until(/#{cut_exp}/i)
				#正規表現にマッチする位置を追加
				s_pos.push(s.pos)
			end
			
			# 制限酵素の認識部位を出力するブロック(結果の見栄えを良くするため)
			# rjust(10)は「右詰の17文字」にするメソッド
			out_file_name.print('制限酵素 ', res_name.rjust(17), " の認識部位は、\s")
			
			# 制限酵素の認識部位の長さ
			cut_pat_len = cut_pat.length
			
			# s_pos に保存した認識部位の位置を出力する
			position_arr = []
			
			if s_pos == []
				out_file_name.print(fasta_name_1, " の配列の中にはありませんでした。\n")
			else
				s_pos.each{|position_1|
					position_2 = position_1 - cut_pat_len + 2
					position_arr.push(position_2)
				}
				out_file_name.print(position_arr)
				out_file_name.print("番目の塩基です。\n")
			end
			}
			print("制限酵素地図解析成功です！\n結果はres_map_result.txtに出力されています。\n")
		}
	end
	
	module_function :prs_rebase
	module_function :make_cut_exp
	module_function :dna_map_making
	
end