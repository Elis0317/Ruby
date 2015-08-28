[grep]
各要素に対してgrepをかけ、マッチする要素を取得する。

# 正規表現にマッチする要素を取得
> %w(Ruby Python Java).grep(/y/)
=> ["Ruby", "Python"]

# 指定の型にマッチする要素を取得
> ["Ruby", "Python", "Java", 1, 10, 100].grep(String)
=> ["Ruby", "Python", "Java"]
> ["Ruby", "Python", "Java", 1, 10, 100].grep(Integer)
=> [1, 10, 100]
