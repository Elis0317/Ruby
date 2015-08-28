### File-name: hash-4.rb ###

hash_1 = { "AA"=>"ACDEFGHIKLMNPQRSTUVWY",
					 "DNA"=>"ATCG", "RNA"=>"AUCG"}

p hash_1

hash_1.delete("DNA")		# [.delete]によりハッシュ内のデータを削除

p hash_1								#=>{ "AA"=>"ACDEFGHIKLMNPQRSTUVWY", "RNA"=>"AUCG"}