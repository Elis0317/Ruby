[map]
元の配列の各要素を変換して、新しい配列をつくる

> %w(Ruby Python Java).map { |s| s.upcase }
=> ["RUBY", "PYTHON", "JAVA"]

e.g.
[1 2 3 4 5]と入力すると、aから順に1, 2, 3, 4, 5を代入する
	1) a, b, c, d, e = gets().split().map{|i| i.to_i}
	2) a, b, c, d, e = gets().split().map(&:to_i)    #<=同じ記述、()と{}に注意