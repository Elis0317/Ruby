#! ruby -Ks

### sample-name: q8 ###

# File.open�ɂ�鉖��z��̓ǂݍ��݂Ə����o��
seq = ""

File.open('sample-out.data', 'w'){|out_file_name|
	seq = File.read('C:\Users\Kubono\Desktop\ruby\-8\dna-5-1.txt')
	seq_1 = seq.gsub("\n", "")
	out_file_name.print(seq_1)
}

# �����̓ǂݎ��
string = File.read('sample-out.data')
seq_num = string.length

# �����o�����t�@�C��������ۂɓǂݍ���
string_2 = File.open('sample-out.data')
for i in 1..(seq_num / 10)
	string_2.seek(i * 10 - 1)
	
	dna_w = string_2.read(1)
	print(i * 10 , "�����ڂ�\s", dna_w, "\s�ł��B\n")
end
