# File.open,��each�̎��A| |�ň͂����ϐ��̓��[�J���ϐ��Ȃ̂Ń��\�b�h�O�ł͎g���Ȃ�
# �������A���\�b�h�ƈႢ�O���̕ϐ��͂��̂܂ܗ��p�\�B����ɁAreturn�Ȃǂ��g���Ȃ�
# �]���āA���\�b�h�O�ŕϐ���錾���A��������\�b�h�I������g�����ƁB
# ���\�b�h���̕ϐ��̂��Ƃ͋C�ɂ�����K�v�Ȃ��I

seq = ''

File.open('dna-5-1.txt') do |f|
	f.each{|ln|
		seq = seq + ln.chomp
	}

p seq
end