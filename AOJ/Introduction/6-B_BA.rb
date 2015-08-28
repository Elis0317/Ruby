#マークを配列化
symbols = ['S', 'H', 'C', 'D']

#カードの枚数 
n = gets.chomp.to_i

#カードを入れる配列を作製し、そこにカードを代入
cards = []
n.times do
  cards << gets.chomp # <= e.g."H 3"
end

#p cards <= e.g.["S 1"],["S 2"],...["D 13"]](欠けアリ)

symbols.each do |s|
  for i in 1..13 do
    c = "#{s} #{i}" #<= ["S 1"],["S 2"],...["D 13"]](欠けナシ)
    # "#{s} #{i}" は共に正規表現
    
    puts c  unless cards.include?(c)
    #unless以下がfalseなら左の処理を実行、今回はcard内にcが存在するか否か
  end
end

#総評
#カードのマークと番号を分けたせいで、非常に冗長なコードになってしまった。
#初めから"S 1"があるかどうかを区別するコードは、短くすっきりしている。

#forは変数が多くなって見づらい。timeが使える局面は使っていこう。
#またunless, ifなどの条件分岐を使った1行の文章も、分かりやすいので使っていこう。