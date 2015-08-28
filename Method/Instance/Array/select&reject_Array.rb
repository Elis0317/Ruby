[select]
戻り値が真になった要素を全て取得。

> %w(Ruby Python Java C Smalltalk Brainfuck).select { |s| s.include?("y") }
=> ["Ruby", "Python"]

[reject]
戻り値が真になった要素以外を全て取得。

> %w(Ruby Python Java C Smalltalk Brainfuck).reject { |s| s.include?("y") }
=> ["Java", "C", "Smalltalk", "Brainfuck"]
