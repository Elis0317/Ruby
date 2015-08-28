### FIle-name: sample-hensu-5-6.rb ###
# True -> number (0, 21 ---), False -> nil

pro_seq = "MLAVGAMEGTRQSAFLLSSP\nPLAALHSMAEMKTPLYPAAYPP"

print('pro_seq =', "\n")
print(pro_seq, "\n\n")

print('Pattern_1 = ')
p pro_seq =~ /YPP\z/

#[\z]は文字列の先頭の意味
#ここでは文字列の最後に存在するか…？（即ち[\n]の前は含まない)の意味で使われている

print("\n")

print('Pattern_2 = ')
p pro_seq =~ /SSP\z/
print("\n")

print('Pattern_3 = ')
p pro_seq =~ /YPP$/
#[$]は各行の最後の意味
#ここでは各行の最後に存在するか…？（即ち[\n]の前も含む)の意味で使われている
print("\n")

print('Pattern_4 = ')
p pro_seq =~ /SSP$/
print("\n")