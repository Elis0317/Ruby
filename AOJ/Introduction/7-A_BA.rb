while (ln = gets.chomp) != '-1 -1 -1' do
  m, f, r = ln.split.map{|e| e.to_i}
  if m < 0 || f < 0
    puts 'F'
  else
    sum = m + f
    if sum >= 80
      puts 'A'
    elsif sum >= 65
      puts 'B'
    elsif sum >= 50
      puts 'C'
    elsif sum >= 30
      if r >= 50
        puts 'C'
      else
        puts 'D'
      end
    else
      puts 'F'
    end
  end
end

#総評
#while [条件式] do end の条件式について、 (in = gets.chomp) != '-1 -1 -1'と、
#条件式の中にgetsを入れてloopの判定に使うことが可能らしい。
#while (input = gets) == nil do とすれば、nilのときにループから抜け出す式になってるはず(動作未確認）
#そのような条件があったら使おう!