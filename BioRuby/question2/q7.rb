#! ruby -Ks

### File-name: q7.rb

# アミノ酸配列を格納
seq = ""

# 改行を除いた配列ファイルの作成
File.open('sample-seq-1.txt'){|file_name|
	file_name.each{|line_data|
		line = line_data.chomp
		seq << line
	}
}

# アミノ酸配列の長さを取得
seq_num = seq.length 

# アミノ酸を格納する変数の初期化
a_num = 0
c_num = 0
d_num = 0
e_num = 0
f_num = 0
g_num = 0
h_num = 0
i_num = 0
k_num = 0
l_num = 0
m_num = 0
n_num = 0
p_num = 0
q_num = 0
r_num = 0
s_num = 0
t_num = 0
v_num = 0
w_num = 0
y_num = 0

seq_2 = File.open('sample-seq-1.txt')

for i in 0..seq_num-1
	seq_2.seek(i)
	
	dna_w = seq_2.read(1)
	
	case dna_w
	when 'A'
		a_num = a_num + 1
		#ここから、全てのアミノ酸について記述
	end
end
p a_num