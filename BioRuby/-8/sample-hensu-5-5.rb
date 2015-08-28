### FIle-name: sample-hensu-5-5.rb ###
# True -> number (0, 21 ---), False -> nil

pro_seq = "MLAVGAMEGTRQSAFLLSSP\nPLAALHSMAEMKTPLYPAAYPP"

print('pro_seq =', "\n")
print(pro_seq, "\n\n")

print('Pattern_1 = ')
p pro_seq =~ /\AMLA/

#[\A]は文字列の先頭の意味
#ここでは文字列の先頭に存在するか…？（即ち[\n]の後ろは含まない)の意味で使われている

print("\n")

print('Pattern_2 = ')
p pro_seq =~ /\APLA/
print("\n")

print('Pattern_3 = ')
p pro_seq =~ /^MLA/
#[^]は各行の先頭の意味
#ここでは各行の先頭に存在するか…？（即ち[\n]の後ろも含む)の意味で使われている
print("\n")

print('Pattern_4 = ')
p pro_seq =~ /^PLA/
print("\n")