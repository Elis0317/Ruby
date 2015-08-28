#! ruby -Ks

### File_name: q4.rb ###

print("文字を入力してリターンを押してください\n")
ge = gets.chomp
text = File.read('C:\Users\Kubono\Desktop\ruby\-8\sample-seq-2.txt')

sub_text = text.sub(ge, 'XXX')		# 入力された文字の一番初めのみを'XXX'に置換
print('sub_text = ', "\n", sub_text)

gsub_text = text.gsub(ge, 'XXX')	# すべての入力された文字を'XXX'に置換
print('gsub_text = ', "\n", gsub_text)