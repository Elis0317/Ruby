#! ruby -Ks

### File_name: q4.rb ###

print("��������͂��ă��^�[���������Ă�������\n")
ge = gets.chomp
text = File.read('C:\Users\Kubono\Desktop\ruby\-8\sample-seq-2.txt')

sub_text = text.sub(ge, 'XXX')		# ���͂��ꂽ�����̈�ԏ��߂݂̂�'XXX'�ɒu��
print('sub_text = ', "\n", sub_text)

gsub_text = text.gsub(ge, 'XXX')	# ���ׂĂ̓��͂��ꂽ������'XXX'�ɒu��
print('gsub_text = ', "\n", gsub_text)