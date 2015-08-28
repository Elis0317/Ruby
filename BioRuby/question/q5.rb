#! ruby -Ks

### FIle-name: q5.rb ###

print("文字を入力してReturnを押してください\n")
ge = gets.chomp

data_1 = File.read('C:\Users\Kubono\Desktop\ruby\-8\name_data_1.txt')

sp_data_1 = data_1.chomp.split(ge)	# [.split]により入力された文字でデータを分割し、配列にそれぞれ代入
p sp_data_1