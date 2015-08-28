### File_name: sample-hensu-4-4.rb ###
text = File.read('sample-seq-2.txt')

sub_text = text.sub('SSS', 'XXX')	#‰‚ß‚Ì'SSS'‚ğ'XXX'‚É’uŠ·

print('sub_text = ', "\n", sub_text)

gsub_text = text.gsub('SSS', 'XXX')	#‚·‚×‚Ä‚Ì'SSS'‚ğ'XXX'‚É’uŠ·

print('gsub_text = ', "\n", gsub_text)