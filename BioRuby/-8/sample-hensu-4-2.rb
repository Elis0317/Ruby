#! ruby -Ks

### File-name: sample-hensu-4-2.rb

text = File.read('sample-seq-2.txt')
print(text, "\n")

dwn_text = text.downcase	# �e�L�X�g�̑啶�����������ɕϊ�
print(dwn_text, "\n")

up_text = dwn_text.upcase	# �e�L�X�g�̏�������啶���ɕϊ�
print(up_text, "\n\n")


print("���̃e�L�X�g��\n", text, "\n")
dwn_text2 = text.downcase!# [!]������ƁA�Q�Ƃ���text��downcase�̑Ώۂ�
print("�j��I���\�b�h���s���ƁAdwn_text�͂�����񏬕���\n", dwn_text2, "\n")
print("�j��I���\�b�h���s���ƁAtext���������ɂȂ��Ă��܂�\n", text, "\n")
