### FIle-name: sample-hensu-5-6.rb ###
# True -> number (0, 21 ---), False -> nil

pro_seq = "MLAVGAMEGTRQSAFLLSSP\nPLAALHSMAEMKTPLYPAAYPP"

print('pro_seq =', "\n")
print(pro_seq, "\n\n")

print('Pattern_1 = ')
p pro_seq =~ /YPP\z/

#[\z]�͕�����̐擪�̈Ӗ�
#�����ł͕�����̍Ō�ɑ��݂��邩�c�H�i����[\n]�̑O�͊܂܂Ȃ�)�̈Ӗ��Ŏg���Ă���

print("\n")

print('Pattern_2 = ')
p pro_seq =~ /SSP\z/
print("\n")

print('Pattern_3 = ')
p pro_seq =~ /YPP$/
#[$]�͊e�s�̍Ō�̈Ӗ�
#�����ł͊e�s�̍Ō�ɑ��݂��邩�c�H�i����[\n]�̑O���܂�)�̈Ӗ��Ŏg���Ă���
print("\n")

print('Pattern_4 = ')
p pro_seq =~ /SSP$/
print("\n")