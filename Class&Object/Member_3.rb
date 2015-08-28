#coding: utf-8
class Member_3
  def initialize name="anonymous"
    @name = name.to_s
  end
  def hello
    puts "Hello," + @name + "!"
  end
  def bye
    puts "good-bye," + @name + "..."
  end
end

taro = Member_3.new("Taro")
hanako = Member_3.new("Hanako")
taro.hello
hanako.bye

# initialize: コンストラクタ、というメソッド
# Rubyでは、.newメソッドが呼び出された時、まずinitializeメソッドを検索、見つかった場合それを呼び出す
#   =>このメソッド内で初期化しておけば @nameの設定は忘れない

# initializeには引数を指定可能
#   =>引数を指定しないとエラーが起こるため、引数の入力忘れがなくなる

# initializeの引数に、あらかじめ値を代入することが可能
# もし、Member3.new()とした場合、ここでは @name = "anonymous" となる