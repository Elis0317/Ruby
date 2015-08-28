loop{
  data = gets
  if data==nil then #<=コンソール上でnilを打ちこむことは不可能だが…
    break
  end
  data = data.split(nil) #<= .splitと同じ(空白で区切る)
  result = data[0].to_i+data[1].to_i
  puts result.to_s.length
}