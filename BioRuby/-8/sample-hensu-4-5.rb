### File-name: sample-hensu-4-5.rb ###

dna_1 = File.read('dna-1-1.txt')

### �eDNA���A���₷��DNA�ɒu���i��������j

cdna_1 = dna_1.gsub('c', 'G')
cdna_1 = cdna_1.gsub('g', 'C')
cdna_1 = cdna_1.gsub('a', 'T')
cdna_1 = cdna_1.gsub('t', 'A')

### �eDNA���A���₷��DNA�ɒu���i�����܂Łj
###���̉���z��i�������j����������啶���ɂ��A�f�o�b�O���₷���悤��

cdna_2 = cdna_1.reverse		#������̏��Ԃ��t��

cdna_2 = cdna_2.downcase	#�啶�����������ɏC���A�����I

print('cDNA = ', cdna_2)