### File-name: sample-hensu-5-4.rb
# True -> number (0, 17 ---) False -> nil

text_seq = "ATGCGTTGATGAGAAGGATGCATGCATGC"

print('Pattern_1 =', "\n")
p text_seq =~ /ATGC+ATGC/	# [+]�͑O�̕�����1��ȏ�J��Ԃ��Ƃ��Ɏg�����K�\��

# [=~�i�`���_�j]�́A���K�\���ɓ��Ă͂܂�p�^�[�������݂��邩���m���߂�L��
# �}�b�`����p�^�[�������݂��A���̏��߂̕�����n�����ڂ̎��An-1��Ԃ��B
# �Ȃ��Ƃ��� nil ��Ԃ��B

print('Pattern_2 =', "\n")
p text_seq =~ /(ATGC){2}/	#[ATGC]��2��J��Ԃ����Ƃ��Ɏg�����K�\��

print('Pattern_3 =', "\n")
p text_seq =~ /(ATGC){2,}/	#[ATGC]��2��ȏ�J��Ԃ����Ƃ��Ɏg�����K�\��