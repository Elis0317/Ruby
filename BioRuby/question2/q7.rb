#! ruby -Ks

### File-name: q7.rb

# �A�~�m�_�z����i�[
seq = ""

# ���s���������z��t�@�C���̍쐬
File.open('sample-seq-1.txt'){|file_name|
	file_name.each{|line_data|
		line = line_data.chomp
		seq << line
	}
}

# �A�~�m�_�z��̒������擾
seq_num = seq.length 

# �A�~�m�_���i�[����ϐ��̏�����
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
		#��������A�S�ẴA�~�m�_�ɂ��ċL�q
	end
end
p a_num