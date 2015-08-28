[include?]
include?メソッドは、配列の要素に引数objが含まれていればtrue、なければfalseを返します。
要素と引数objが同じかどうかの比較には==メソッドが使われます。

e.g.
animals = ["dog", "cat", "mouse"]
	puts animals.include?("cat") #<= true
	puts animals.include?("elephant") #<= false