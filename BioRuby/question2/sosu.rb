#-----------------------------
# ��3 �f��
# 10000�܂ł̑f����񋓂��Ȃ����B
#-----------------------------

#-----------------------------
# �f����2����10000�܂�
# 2����i�̒��ɁA�񐔂��������邩�𔻒肷��
# �񐔂�1�Ȃ�f��
#-----------------------------

yk = 0
set = 100

for i in 4..7
	for j in 2..i
		if i % j == 0
			yk = yk + 1
		end
		
		if yk == 1
			num_ok = i
		else
			num_ok = ""
		end
	end
	
	if num_ok != ""
		print(num_ok)
		#else
		#print("NO...")
	end
	
end