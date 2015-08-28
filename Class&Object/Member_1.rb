# @（変数） => インスタンス変数
# クラス内では、「メソッドを抜けても」変数が使える（ローカル変数のようにエラーが生じない）

class Member_1
  @name = "anonymous"
  def setName(name)
    @name = name.to_s
  end
  def hello
    puts "Hello, " + @name + "!"
  end
  def bye
    puts "good-bye, " + @name + "..."
  end
end

taro = Member_1.new()
taro.setName("Taro")
hanako = Member_1.new()
hanako.setName("Hanako")
taro.hello
hanako.bye

# インスタンス変数は外部から直接アクセスできない！ =>setNameというメソッドを作った
#   変数のように変更できないの？ =>Member_2へ