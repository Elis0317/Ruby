[select]
�߂�l���^�ɂȂ����v�f��S�Ď擾�B

> %w(Ruby Python Java C Smalltalk Brainfuck).select { |s| s.include?("y") }
=> ["Ruby", "Python"]

[reject]
�߂�l���^�ɂȂ����v�f�ȊO��S�Ď擾�B

> %w(Ruby Python Java C Smalltalk Brainfuck).reject { |s| s.include?("y") }
=> ["Java", "C", "Smalltalk", "Brainfuck"]
