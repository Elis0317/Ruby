### File-name: hairetsu-3.rb ###

hairetsu_1 = ['protein', 'DNA', 'RNA']
p hairetsu_1	#=> ["protein", "DNA", "RNA"]

hairetsu_1.push('Genome')			# �z��̍Ō�Ƀf�[�^��ǉ�����
p hairetsu_1	#=> ["protein", "DNA", "RNA", "Genome"]

data_1 = hairetsu_1.pop				# �z��̍Ōォ��f�[�^�����o���i���̔z��Ƀf�[�^�͎c��Ȃ��j
p hairetsu_1	#=> ["protein", "DNA", "RNA"]
p data_1			#=> "Genome"

hairetsu_1.unshift('Genome')	#�z��̐擪�Ƀf�[�^��ǉ�����
p hairetsu_1	#=> ["Genome", "protein", "DNA", "RNA"]

data_2 = hairetsu_1.shift			#�z��̐擪����f�[�^�����o��
p hairetsu_1	#=> ["protein", "DNA", "RNA"]
p data_2			#=> "Genome"

#-----------------------------
#�܂Ƃ�
#�f�[�^�����o��
#�擪����...[shift], �Ōォ��...[pop]
#
#�f�[�^��ǉ�����
#�擪��...[unshift], �Ō��...[push]
#-----------------------------