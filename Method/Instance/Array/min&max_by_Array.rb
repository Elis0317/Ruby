min_by, max_by, minmax_by

�u���b�N�ŕ]���������ʂ̒l�Ŕ�r����B
�i�u���̍ŏ��l/�ő�l���v�����߂鎖���o����j

> lang = %w(Ruby Python Java C)
> lang.min_by { |s| s.length }
=> "C"
> lang.max_by { |s| s.length }
=> "Python"
> lang.minmax_by { |s| s.length }
=> ["C", "Python"]
