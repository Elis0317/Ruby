#! ruby -Ks

#-----------------------------
# ��5 �����ăQ�[��
# �R���s���[�^�̍l����4�P�^�̐����𓖂Ă�B
# ������1-9�ŁA���������͎g�p�ł��Ȃ��B
#-----------------------------

# �Q�[���I�[�o�[�ɂȂ���͉񐔂��w��
GameOver = 2

def ran
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr_ran = arr.shuffle

	return arr_ran	# �����_���Ȕz���Ԃ��A���̂���[0]-[3]�݂̂��g��
end

num_arr = ran
num = 1000 * num_arr[0] + 100 * num_arr[1] + 10 * num_arr[2] + num_arr[3]
# p num #<= ������������

# ���͂��ꂽ�������i�[����z����쐬
insert_arr = Array.new(4)

# ���ۂ̓��͂Ə���
insert = gets.chomp.to_i
	print("���Ȃ��̓��͂��������́A", insert, " �ł��ˁB\n")
p insert

insert_0 = insert / 1000
insert_arr[0] = insert_0
insert_n = insert - 1000 * insert_0

insert_1 = insert_n / 100
insert_arr[1] = insert_1
insert_n = insert_n - 100 * insert_1

insert_2 = insert_n / 10
insert_arr[2] = insert_2
insert_n = insert_n - 10 * insert_2

insert_3 = insert_n
insert_arr[3] = insert_3

p insert_arr
# ��������͂����񐔂�\��
kaisu = 1
	print("����́A", kaisu, " ��ڂ̐����Ăł��B\n")

until insert == num
	### ����v���O����
	hit = 0
	blow = 0
	
	for j in 0..3
		# Blow�̊m�F
		if (insert_arr[j] == num_arr[0]) || (insert_arr[j] == num_arr[1]) || (insert_arr[j] == num_arr[2]) || (insert_arr[j] == num_arr[3]) 
		
			# Blow�̂����AHit���ǂ����𔻒�
			if insert_arr[j] == num_arr[j]
				hit = hit + 1
				
			else
				blow = blow + 1
			end
		
		# Hit�ł�Blow�ł��Ȃ���Ή������Ȃ�
		end
	end
	
	
	print("\nHit...", hit, "!!\n")
	print("Blow...", blow, "!\n")
	
	# 2��ڈȍ~�̓���
	
	for i in 0..3
		print( i+1, "�Ԗڂ̐�������͂��āAReturn�������Ă�������\n")
		insert_arr[i] = gets.chomp.to_i
	end
	
	insert = 1000 * insert_arr[0] + 100 * insert_arr[1] + 10 * insert_arr[2] + insert_arr[3]
	print("���Ȃ��̓��͂��������́A", insert, " �ł��ˁB\n")
	
	# ���͂����񐔂𑝂₷
	kaisu = kaisu + 1
	print("����́A", kaisu, " ��ڂ̐����Ăł��B\n")
	
	# �K��񐔈ȏ���͂�����Q�[���I�[�o�[
	if kaisu >= GameOver
		print("\n���͂�", GameOver, "��𒴂��܂������A���Ȃ��͐����ɂ��ǂ蒅���܂���ł����B\n")
		print("�����́A", num, "�ł����B\n")
		print("Game Over...\n")
		break
	end
	
end

if kaisu < GameOver
	print("Clear!!")
end