min_by, max_by, minmax_by

ブロックで評価した結果の値で比較する。
（「何の最小値/最大値か」を決める事が出来る）

> lang = %w(Ruby Python Java C)
> lang.min_by { |s| s.length }
=> "C"
> lang.max_by { |s| s.length }
=> "Python"
> lang.minmax_by { |s| s.length }
=> ["C", "Python"]
