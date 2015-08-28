#! ruby -Ks

### File-name: dna-res-map-1.rb ###

#-----------------------------
# 基本的な流れ
#
# 1. 制限酵素のデータをハッシュに格納(キー:制限酵素名, データ:切断パターン）
# 2. DNA配列をファイルから読み取る
# 3. 切断パターンを正規表現に変換
# 4. 正規表現に変換した制限酵素の切断パターンとDNA配列を照合し、切断部位を特定
# 5. 制限酵素の切断部位を出力
#-----------------------------

require 'strscan'
#-----------------------------
# [require '()']は同じプログラム上にないメソッドを使用するための記述方法
# ()にはメソッドが記述されているプログラム名を記述、拡張子[.rb]は省略可能
#
# strscanはRubyで用意してあるもの
# 正規表現のマッチする位置を操作する[StringScannerクラス]のメソッドを利用できるようになる
#-----------------------------

### メソッド定義

#-----------------------------
# 制限酵素のデータをハッシュ[res_data_hash]に格納するメソッド
# 引数は制限酵素のデータを格納するハッシュ[res_data_hash(new)]と、読み取った1行分のデータ[line_data.chomp]
#-----------------------------

def prs_rebase(res_data_hash, res_data)
	
	#---------------------------
	# このメソッドが呼ばれた時、ファイルから制限酵素のデータかどうかを判断 => True の状態
	# よって、受け取った1行分の酵素データを制限酵素名と切断パターンに分割していく
	#---------------------------
	
	res_data_arr_temp = res_data.split("\s")
	
	# 制限酵素名を取得
	res_name = res_data_arr_temp.shift	# [shift]は配列の先頭からデータを取り出す
																			# ここでは制限酵素テキストの先頭からの文字列、すなわち制限酵素名になる
	
	# 制限酵素の切断パターンを保存する変数
	res_pat = ""
	
	# 最初のパターンを保存
	res_data_arr_temp.each{|data_tmp|
		
		# 括弧:( で始まらない要素
		# (制限酵素の元データには[AciI CCGC (-3/-1)]のように、()が付いたデータがあるのでそれを除去している)
		if data_tmp !~ /^\(/
			res_pat = data_tmp
		end
		
	}
	
	# 制限酵素名をキーに、切断パターンをデータに保存
	res_data_hash[res_name] = res_pat
	
	# 制限酵素のデータを保存したハッシュを返す
	return res_data_hash
	
end


# 制限酵素の切断パターンの正規表現を作製するメソッド
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


### メインプログラム

#制限酵素のデータを格納するハッシュ
res_data_hash = Hash.new

# ファイルから制限酵素のデータを取得(REBASE形式)
File.open('link_proto.txt'){|file_name|

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
File.open('dna-5-1.fasta'){|file_name|
	
	file_name.each{|line_data|
		
		# 最初の行を保存
		if line_data =~ /^>/
			fasta_name_1 = line_data.chomp
			break
		# DNA配列を追加
		else
			dna_seq_1 << line_data.chomp #[<<] 文字列の連結
		end
		
		#-------------------------
		#FASTA形式はこのような感じ
		#
		#>sp|P78426|NKX61_HUMAN Homeobox protein Nkx-6.1
		#MLAVGAMEGTRQSAFLLSSPPLAALHSMAEMKTPLYPAAYPPLPAGP...
		#
		#一行目は[>]ではじまり、どのDNAの配列かを載せている
		#二行目以降は塩基配列が来る
		#-------------------------
	}
}

# ハッシュ res_data_hashのキーとデータを
# eachを使用して全て呼び出す
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
	
	# 制限酵素の認識部位を出力するブロック
	print('制限酵素 ', res_name, " の認識部位は: ")
	
	# 制限酵素の認識部位の長さ
	cut_pat_len = cut_pat.length
	
	# s_pos に保存した認識部位の位置を出力する
	s_pos.each{|position_1|
	
		# scanは正規表現にマッチする認識部位の一番最後の位置を返すメソッドなので、
		# DNA配列の中での位置は以下のようになる
		position_2 = position_1 - cut_pat_len + 2
		print(position_2, "文字目\s")
	}

	print("\n")

}
