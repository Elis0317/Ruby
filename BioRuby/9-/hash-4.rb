### File-name: hash-4.rb ###

hash_1 = { "AA"=>"ACDEFGHIKLMNPQRSTUVWY",
					 "DNA"=>"ATCG", "RNA"=>"AUCG"}

p hash_1

hash_1.delete("DNA")		# [.delete]�ɂ��n�b�V�����̃f�[�^���폜

p hash_1								#=>{ "AA"=>"ACDEFGHIKLMNPQRSTUVWY", "RNA"=>"AUCG"}