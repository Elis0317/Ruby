### File_name: sample-hensu-4-4.rb ###
text = File.read('sample-seq-2.txt')

sub_text = text.sub('SSS', 'XXX')	#初めの'SSS'を'XXX'に置換

print('sub_text = ', "\n", sub_text)

gsub_text = text.gsub('SSS', 'XXX')	#すべての'SSS'を'XXX'に置換

print('gsub_text = ', "\n", gsub_text)