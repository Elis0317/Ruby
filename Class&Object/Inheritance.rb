#coding: utf-8
class Member  #スーパークラスの作成
  def initialize name
    @name = name.to_s
  end
  def hello
    puts "Hello," + @name + "!"
  end
  def bye
    puts "good-bye," + @name + "..."
  end
end

class PowerMember < Member  # スーパークラスを基にしたサブクラスの作成
  def initialize name, age
    @name = name.to_s
    @age = age.to_i
  end
  def hello
    puts "hello, I am " + @name + ". I'm " + @age.to_s + " old!"
  end
end

taro = Member.new("Taro")
hanako = PowerMember.new("Hanako", 24)
taro.hello
hanako.hello
taro.bye
hanako.bye # <=byeメソッドは PowerMemberにはないが、Memberクラスを継承しているためエラーにならず、使える