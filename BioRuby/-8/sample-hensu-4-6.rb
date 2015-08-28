### FIle-name: sample-hensu-4-6.rb ###

data_1 = File.read('name_data_1.txt')

sp_data_1 = data_1.chomp.split(';')

### [.split]でデータを分割し、配列にデータを分割して代入

p sp_data_1 # <=配列が表示される