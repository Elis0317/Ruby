#�}�[�N��z��
symbols = ['S', 'H', 'C', 'D']

#�J�[�h�̖��� 
n = gets.chomp.to_i

#�J�[�h������z����쐻���A�����ɃJ�[�h����
cards = []
n.times do
  cards << gets.chomp # <= e.g."H 3"
end

#p cards <= e.g.["S 1"],["S 2"],...["D 13"]](�����A��)

symbols.each do |s|
  for i in 1..13 do
    c = "#{s} #{i}" #<= ["S 1"],["S 2"],...["D 13"]](�����i�V)
    # "#{s} #{i}" �͋��ɐ��K�\��
    
    puts c  unless cards.include?(c)
    #unless�ȉ���false�Ȃ獶�̏��������s�A�����card����c�����݂��邩�ۂ�
  end
end

#���]
#�J�[�h�̃}�[�N�Ɣԍ��𕪂��������ŁA���ɏ璷�ȃR�[�h�ɂȂ��Ă��܂����B
#���߂���"S 1"�����邩�ǂ�������ʂ���R�[�h�́A�Z���������肵�Ă���B

#for�͕ϐ��������Ȃ��Č��Â炢�Btime���g����ǖʂ͎g���Ă������B
#�܂�unless, if�Ȃǂ̏���������g����1�s�̕��͂��A������₷���̂Ŏg���Ă������B