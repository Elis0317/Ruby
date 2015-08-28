### File-name: sample-hensu-5-3.rb

###PFlMIの認識配列は [5' CCANNNNN:TGG 3']

text = File.read('dna-5-1.txt')

text_1 = text.gsub("\n", "")
print(text_1, "\n\n")

pfl_text = text_1.gsub(/cca[atgc]{5}tgg/, 'CCANNNNNTGG')	#[atgc]{5] => [a]or[t]or[g]or[c]を5回繰り返す

print('PflMI =', "\n", pfl_text)