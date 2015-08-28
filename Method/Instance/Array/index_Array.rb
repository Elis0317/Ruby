[index]
indexメソッドは、配列から引数objと同じ要素を探し、その位置を整数で返します。
（1番目が0、2番目が1、...）要素が見つからないときは、nilを返します。

e.g.
fruits = ["apple", "orange", "banana", "kiwi"]
	puts fruits.index("banana") #<= 2
	puts fruits.index("grape")  #<= nil