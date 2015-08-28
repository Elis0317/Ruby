[times]
「times」メソッドは、変数に「0」から「対象のオブジェクトが持つ数値 - 1」を順に代入しながら
「{」から「}」までの処理(又は「do」から「end」までの処理)を実行します。
1回繰り返す毎に1ずつ数値は増加します。

e.g.
n = gets.chomp.to_i
n.times do |i| #<= |i|はなくても可、i の初期値は0
  #処理
end

すなわち、以下の処理と同じ
n = gets.chomp.to_i
for i in 0..n - 1
  # 処理
end