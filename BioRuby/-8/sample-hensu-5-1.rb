### File-name: sample-hensu-5-1.rb

###EcoR1�̔F���z��� [5' GA:ATTC 3']
text = File.read('dna-5-1.txt')

text_1 = text.gsub("\n", "")
print(text_1, "\n\n")

eco_text = text_1.gsub(/gaattc/,'GAATTC')	#���K�\����[/ /]�̊ԂɒT������������̃p�^�[�����L�q����

print('text-EcoR1 =', "\n", eco_text)