#! ruby -Ks

### FIle-name: q5.rb ###

print("��������͂���Return�������Ă�������\n")
ge = gets.chomp

data_1 = File.read('C:\Users\Kubono\Desktop\ruby\-8\name_data_1.txt')

sp_data_1 = data_1.chomp.split(ge)	# [.split]�ɂ����͂��ꂽ�����Ńf�[�^�𕪊����A�z��ɂ��ꂼ����
p sp_data_1