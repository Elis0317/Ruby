loop{
  data = gets
  if data==nil then #<=�R���\�[�����nil��ł����ނ��Ƃ͕s�\�����c
    break
  end
  data = data.split(nil) #<= .split�Ɠ���(�󔒂ŋ�؂�)
  result = data[0].to_i+data[1].to_i
  puts result.to_s.length
}