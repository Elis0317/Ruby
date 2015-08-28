### File-name: sample-hensu-5-3.rb

###PFlMIの認識配列は [5' CCANNNNN:TGG 3']

text = File.read('dna-5-1.txt')

text_1 = text.gsub("\n", "")
print(text_1, "\n\n")

pfl_text = text_1.gsub(/cca.....tgg/, 'CCANNNNNTGG')	#[.]任意の1文字を表す

print('PflMI =', "\n", pfl_text)