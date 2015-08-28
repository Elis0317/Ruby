###File-name: sample-puts-2.rb ###
puts "ENFSGGCVAG"
puts "100"		#<= 文字列"100"#
puts 100			#<= 数値100（putsでは区別が見えない、自動改行）#

p "ENFSGGCVAG"
p "100"			#<= 文字列"100"#
p 100			#<= 数値100（pでは区別が見える、自動改行）#
			# 区別が見えるため、#pがデバッグでよく使われる#

print ("ENFSGGCVAG")	#自動改行なし、そのため結果はENFSGGCVAG100100#
print ("100")
print(100)

print ("\nENFSGGCVAG\n100\n100") #改行記号を挿入

#print(出力を制御する記述が書ける)
#改行記号は[\n], タブ記号は[\t], スペース記号は[\s]