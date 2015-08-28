### File-name: hairetsu-4.rb

hairetsu_1 = [7,9,4,1,3,6,2,5,0,8]

p hairetsu_1.sort		#=> [0,1,2,3,4,5,6,7,8,9]

hairetsu_2 = ['protein', 'DNA', 'RNA']

p hairetsu_2.sort 		#=> ["DNA", "RNA", "protein"]

p hairetsu_2.reverse	#=> ["RNA", "DNA", "protein"]

p hairetsu_2					#=> ["protein", "DNA", "RNA"]

# [sort] => 昇り順に配列を並び替え
# [reverse]配列の並び順を完全に逆に（並び替えは行わない）
# どちらも、もとの配列は破壊しない