### File-name: hash-3.rb ###

hash_1 = { "AA"=>"ACDEFGHIKLMNPQRSTUVWY",
					 "DNA"=>"ATCG", "RNA"=>"AUCG"}

p hash_1["DNA"]		#=> "ATCG"		#hash変数["(キー)"]により、ハッシュに格納したデータを呼び出す
p hash_1["RNA"]		#=> "AUCG"

p hash_1["AA"]		#=> "ACDEFGHIKLMNPQRSTUVWY"