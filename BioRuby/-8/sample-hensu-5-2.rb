### File-name: sample-hensu-5-3.rb

###PFlMI‚Ì”FŽ¯”z—ñ‚Í [5' CCANNNNN:TGG 3']

text = File.read('dna-5-1.txt')

text_1 = text.gsub("\n", "")
print(text_1, "\n\n")

pfl_text = text_1.gsub(/cca.....tgg/, 'CCANNNNNTGG')	#[.]”CˆÓ‚Ì1•¶Žš‚ð•\‚·

print('PflMI =', "\n", pfl_text)