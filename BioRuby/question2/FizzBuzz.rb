#------------------------------
# ��2 FizzBuzz
#
#���[���͈ȉ��̒ʂ�
#
# 1���珇�Ԃɐ���\������
# ���̐���3�Ŋ���؂��Ȃ�"Fizz"�A5�Ŋ���؂��Ȃ�"Buzz"�A�����Ŋ���؂��Ȃ�"FizzBuzz"�ƕ\������
#
# ���Ȃ킿�A"1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz ���"�ƁA100("Buzz")�܂ŏo�͂����v���O���������Ȃ����B
#-----------------------------

for i in 1..100
	if i % 15 == 0
		print("FizzBuzz\s")
		
	elsif i % 3 == 0
		print("Fizz\s")
		
	elsif i % 5 == 0
		print("Buzz\s")
		
	else
		print(i, "\s")
	
	end
end