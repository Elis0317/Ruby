### FIle-name: sample-hensu-5-5.rb ###
# True -> number (0, 21 ---), False -> nil

pro_seq = "MLAVGAMEGTRQSAFLLSSP\nPLAALHSMAEMKTPLYPAAYPP"

print('pro_seq =', "\n")
print(pro_seq, "\n\n")

print('Pattern_1 = ')
p pro_seq =~ /\AMLA/

#[\A]�͕�����̐擪�̈Ӗ�
#�����ł͕�����̐擪�ɑ��݂��邩�c�H�i����[\n]�̌��͊܂܂Ȃ�)�̈Ӗ��Ŏg���Ă���

print("\n")

print('Pattern_2 = ')
p pro_seq =~ /\APLA/
print("\n")

print('Pattern_3 = ')
p pro_seq =~ /^MLA/
#[^]�͊e�s�̐擪�̈Ӗ�
#�����ł͊e�s�̐擪�ɑ��݂��邩�c�H�i����[\n]�̌����܂�)�̈Ӗ��Ŏg���Ă���
print("\n")

print('Pattern_4 = ')
p pro_seq =~ /^PLA/
print("\n")