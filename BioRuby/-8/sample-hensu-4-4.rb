### File_name: sample-hensu-4-4.rb ###
text = File.read('sample-seq-2.txt')

sub_text = text.sub('SSS', 'XXX')	#���߂�'SSS'��'XXX'�ɒu��

print('sub_text = ', "\n", sub_text)

gsub_text = text.gsub('SSS', 'XXX')	#���ׂĂ�'SSS'��'XXX'�ɒu��

print('gsub_text = ', "\n", gsub_text)