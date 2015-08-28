### File-name: hairetsu-3.rb ###

hairetsu_1 = ['protein', 'DNA', 'RNA']
p hairetsu_1	#=> ["protein", "DNA", "RNA"]

hairetsu_1.push('Genome')			# 配列の最後にデータを追加する
p hairetsu_1	#=> ["protein", "DNA", "RNA", "Genome"]

data_1 = hairetsu_1.pop				# 配列の最後からデータを取り出す（元の配列にデータは残らない）
p hairetsu_1	#=> ["protein", "DNA", "RNA"]
p data_1			#=> "Genome"

hairetsu_1.unshift('Genome')	#配列の先頭にデータを追加する
p hairetsu_1	#=> ["Genome", "protein", "DNA", "RNA"]

data_2 = hairetsu_1.shift			#配列の先頭からデータを取り出す
p hairetsu_1	#=> ["protein", "DNA", "RNA"]
p data_2			#=> "Genome"

#-----------------------------
#まとめ
#データを取り出す
#先頭から...[shift], 最後から...[pop]
#
#データを追加する
#先頭に...[unshift], 最後に...[push]
#-----------------------------