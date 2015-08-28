#! ruby -Ks

### File-name: sample-hensu-4-2.rb

text = File.read('sample-seq-2.txt')
print(text, "\n")

dwn_text = text.downcase	# テキストの大文字を小文字に変換
print(dwn_text, "\n")

up_text = dwn_text.upcase	# テキストの小文字を大文字に変換
print(up_text, "\n\n")


print("元のテキストは\n", text, "\n")
dwn_text2 = text.downcase!# [!]をつけると、参照したtextもdowncaseの対象に
print("破壊的メソッドを行うと、dwn_textはもちろん小文字\n", dwn_text2, "\n")
print("破壊的メソッドを行うと、textも小文字になってしまう\n", text, "\n")
