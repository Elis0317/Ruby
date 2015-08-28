### File-name: hairetsu-2-1.rb ###

str_1 = 'protein:DNA:RNA'

hairetsu_1 = str_1.split(":")

p hairetsu_1				#=> [protein:DNA:RNA]

p hairetsu_1.size		#=> 3
#[size]は配列の要素の数を返すメソッド