[inject]
���O�̃u���b�N�̖߂�l���������ϐ��ƁA���݂̗v�f���������ϐ���𗘗p���ĉ��Z�ł���B

> [1, 2, 3, 4].inject(0) { |result, num| result + num }
=> 10    # 0 +1 + 2 + 3 + 4

�������ɂ͏����l�i��L�ł�0�j��ݒ�\�B
�����l���ȗ�����ƁA�擪�̗v�f�������l�Ƃ��ėp������B

> [1, 2, 3, 4].inject { |result, num| result + num }
=> 10    # 1 + 2 + 3 + 4

�J��Ԃ��̓x�ɌĂяo�����\�b�h���V���{���Ŏ󂯎�邱�Ƃ��\�B

> [1, 2, 3, 4].inject(:+)
=> 10
> [1, 2, 3, 4].inject(:*)
=> 24