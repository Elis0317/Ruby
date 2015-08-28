while num = gets
    x, y = num.chomp.split.map(&:to_i)
    #.mapは要素の数だけ繰り返しブロックを実行し、
    #ブロックの戻り値を集めた配列を作成して返します。
    #細かい処理については別記解説
    
  break if x == 0 && y == 0
  puts [x, y].sort.join(' ') # x,yを配列化=> ソート=> joinで配列結合して出力
end

#総評
#配列はやはり便利なので、数をこなして使えるように

#while-break文は、ifの中にbreakを書くのではなく、break ifの形で書くとwhileを抜けられる
#while文でgetsコマンドを使用可能なので、getsを2度書きしないように