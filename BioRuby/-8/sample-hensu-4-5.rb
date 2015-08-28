### File-name: sample-hensu-4-5.rb ###

dna_1 = File.read('dna-1-1.txt')

### 各DNAを、相補するDNAに置換（ここから）

cdna_1 = dna_1.gsub('c', 'G')
cdna_1 = cdna_1.gsub('g', 'C')
cdna_1 = cdna_1.gsub('a', 'T')
cdna_1 = cdna_1.gsub('t', 'A')

### 各DNAを、相補するDNAに置換（ここまで）
###元の塩基配列（小文字）をいったん大文字にし、デバッグしやすいように

cdna_2 = cdna_1.reverse		#文字列の順番を逆に

cdna_2 = cdna_2.downcase	#大文字を小文字に修正、完成！

print('cDNA = ', cdna_2)