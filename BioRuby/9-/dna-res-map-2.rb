#! ruby -Ks

###File-name: dna-res-map-2.rb
# 'strscan'と'gdbm'を呼び出す
require 'strscan'
require 'gdbm'

### メソッド定義
# 制限酵素の切断パターンの正規表現を作製するメソッド
# 引数は切断パターン
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
	
	# 切断パターンから"[^]"を取り除き、1文字ずつ配列へ
	cut_pat_ex = cut_pat.sub("^", "")
	cut_pat_ex_arr = cut_pat_ex.split("")
	
		# 正規表現を保存する変数を初期化
	cut_pat_ex_fin = ""
	
	cut_pat_ex_arr.each{|ch|							# 読み込んだDNAの配列
		sub_cha.each{|dna_ch, dna_ch_exp|		# 正規表現のキーとデータ
			if dna_ch == ch
				cut_pat_ex_fin << dna_ch_exp		
				break
			end
		}
	}
	#---------------------------
	# 読み込んだDNAの配列がキーと一致している場合、データを返す。これをそれぞれの配列で繰り返す。
	# 返された文字列はcut_pat_ex_finに順番に文字列として結合する。
	#---------------------------
	return cut_pat_ex_fin
end

### メインプログラム
# データベース用ファイルを作成
db = GDBM.open('DB_BIONET')

# 制限酵素のデータファイルを開く
lib_file = File.open("link_bionet-dos.txt")

# 入力した制限酵素名でデータベースを検索
# ARGVは配列のようなものだが、入力した文字を配列の中に入れることができる
key_tmp = ARGV[0]
key = key_tmp.chomp

# 制限酵素名に対応したデータを取得
fh = db[key]
if fh
	# データベースにデータが存在する =>対応するデータ習得
	lib_file.seek(fh.to_i, IO::SEEK_SET)
	line_res = lib_file.gets("\n")
else
	print("該当する制限酵素はありません\n")
	db.close
	lib_file.close
	exit!
end

db.close
lib_file.close

# FASTA形式の最初の行を保存する変数の初期化
fasta_name_1 = ""
# DNA配列を保存する変数を初期化
dna_seq_1 = ""

# ファイルからデータを取得(FASTA形式)
File.open('dna-5-1.fasta'){|file_name|
	file_name.each{|line_data|
		if line_data =~ /^>/
			fasta_name_1 = line_data.chomp
		else
			dna_seq_1 << line_data.chomp
		end
	}
}

# 制限酵素のデータを分割
res_name_exp_tmp = line_res.chomp.split("\s")

# 制限酵素名
res_name = res_name_exp_tmp[0]

# 制限酵素の切断パターン
cut_pat = res_name_exp_tmp[-1]

# 制限酵素の切断パターンの正規表現を
# メソッドmake_cut_expを使って作成
cut_exp = make_cut_exp(cut_pat)

s = StringScanner.new(dna_seq_1)

# 制限酵素の切断パターンの正規表現にマッチする位置を保存する配列
s_pos = []

# 制限酵素の切断パターンの正規表現にマッチする位置を、scan を使用して全て取りだす
# [/#{}/]により、変数を正規表現の中に入れ込むことが可能
while s.scan_until(/#{cut_exp}/i)
	s_pos.push(s.pos)
end


# 制限酵素の認識部位を出力するブロック
print('制限酵素 ', res_name, " の認識部位は[ ", cut_pat, " ]です。\n")

# 制限酵素の認識部位の長さ
cut_pat_len = cut_pat.length

# s_posに保存した認識部位の位置を出力する
if s_pos == []
	print(fasta_name_1, "の中に切断できる部位はありませんでした。")
else
	s_pos.each{|position_1|
		position_2 = position_1 - cut_pat_len + 2
		print(fasta_name_1, "の ", position_2, " 番目からの塩基に該当します。\n")
	}
end
