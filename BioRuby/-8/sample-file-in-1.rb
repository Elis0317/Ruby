### File-name: sample-file-in-1.rb ###

text = File.read('sample-seq-1.fasta')	

#-------------------------------------------------------------------
#[File.read(' ')]メソッドにより "一度に" ファイルを読み込む
#容量が大きいとメモリが圧迫されるので注意

#File.read()やprint()の中の[' ']と[" "]の違いは、特殊文字をどのように表示するか

#print('ABC\sDE') =>[ABC DE]	<=特殊記号を半角スペースと認識
#print("ABC\sDE") =>[ABC\sDE]	<=特殊記号をそのまま表示
#-------------------------------------------------------------------

print(text)