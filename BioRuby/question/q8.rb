#! ruby -Ks

### sample-name: q8 ###

# File.openによる塩基配列の読み込みと書き出し
seq = ""

File.open('sample-out.data', 'w'){|out_file_name|
	seq = File.read('C:\Users\Kubono\Desktop\ruby\-8\dna-5-1.txt')
	seq_1 = seq.gsub("\n", "")
	out_file_name.print(seq_1)
}

# 長さの読み取り
string = File.read('sample-out.data')
seq_num = string.length

# 書き出したファイルから実際に読み込む
string_2 = File.open('sample-out.data')
for i in 1..(seq_num / 10)
	string_2.seek(i * 10 - 1)
	
	dna_w = string_2.read(1)
	print(i * 10 , "文字目は\s", dna_w, "\sです。\n")
end
