[grep]
�e�v�f�ɑ΂���grep�������A�}�b�`����v�f���擾����B

# ���K�\���Ƀ}�b�`����v�f���擾
> %w(Ruby Python Java).grep(/y/)
=> ["Ruby", "Python"]

# �w��̌^�Ƀ}�b�`����v�f���擾
> ["Ruby", "Python", "Java", 1, 10, 100].grep(String)
=> ["Ruby", "Python", "Java"]
> ["Ruby", "Python", "Java", 1, 10, 100].grep(Integer)
=> [1, 10, 100]
