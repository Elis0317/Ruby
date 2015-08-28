# coding: utf-8
class Member_2
  attr_accessor:name  # この直後に書かれた変数へは直接アクセスできるようになる
  def hello
    puts "Hello," + @name + "!"
  end
  def bye
    puts "good-bye," + @name + "..."
  end
end

taro = Member_2.new()
taro.name = "Taro"
hanako = Member_2.new()
hanako.name = "Hanako"
taro.hello
hanako.bye

# アクセスするメソッド（アクセサ）の種類
# attr_accessor（読み取り、書き込み）
# attr_reader(読み取りのみ)
# attr_writer(書き込みのみ)

# このメソッドは @name というインスタンス変数を定義しないと正しく利用できない
#   <=このメソッドを知らない人は正しく利用できない
#   =>インスタンスを作るとき、必ず名前が生成されているようにすればよい！(Member_3へ）