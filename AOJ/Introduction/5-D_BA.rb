n = gets.to_i

#1からnまで判定
1.upto(n) do |i|
  
  #3で割りきれるか、3を含むもの
  #条件に合わない場合、左はfalseを、右はnilを返す
  print " #{i.to_s}" if (i % 3 == 0) || i.to_s.index('3')#<= ちゃんと先頭に空白が入っている
end

#最終行に改行を入れる
puts

#総評
#3が存在するかを調べる時、自分はnが4ケタの場合,n / 10**3が3か否かを調べ、
#違ったら最高位を消す、という処理を繰り返して求めた。
#もちろんこれは正しいが、もっと簡便なメソッドである.indexというものが存在する。
#indexは()内の文字(1文字以上)が存在するかを調べ、開始位置を返す。
#存在しなければnilを返すので、ifの偽に相当する。
#これを使えば1行で済んだが、書き方をいろいろ考えてみるのも大切だろう。