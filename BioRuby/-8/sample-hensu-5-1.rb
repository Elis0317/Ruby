### File-name: sample-hensu-5-1.rb

###EcoR1の認識配列は [5' GA:ATTC 3']
text = File.read('dna-5-1.txt')

text_1 = text.gsub("\n", "")
print(text_1, "\n\n")

eco_text = text_1.gsub(/gaattc/,'GAATTC')	#正規表現は[/ /]の間に探したい文字列のパターンを記述する

print('text-EcoR1 =', "\n", eco_text)