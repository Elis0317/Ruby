###File-name:sample-hensu-1-4.rb

suuchi_s = "1234567890"
p suuchi_s

suuchi_i = 1234567890
p suuchi_i

wa = suuchi_s.to_i + suuchi_i
#---------------------------------------
#.to_i�͕ϐ���integer�^�ɕϊ����郁�\�b�h
#[.]�ɂ���ă��\�b�h���Ȃ����Ƃ��\
#
#�� s = "123"
#   p s.to_i.to_s
#
#���̎��A�\������錋�ʂ�"123"�ƂȂ�
#----------------------------------------
p wa