# オブジェクト: ある事柄について関連するメソッドをすべてひとまとめにする、さらに大きなプログラムの塊
# オブジェクトの中にはある役割に関連する「すべての」機能（メソッド）や必要なデータ（定数）がすべてまとめられている
#   オブジェクトの中を見れば、その役割に関するすべてがそろっている！
#   オブジェクトの中ですべて完結している！
#   オブジェクトだけをほかのスクリプトに持ち込んでも、そのまま使える！

# coding: utf-8

# クラス（設計図）の作成
class Msg
  def hello name
    print("Hello,", name, "!\n")
  end
  def bye name
    print("good-bye,", name, "...\n")
  end
end

# インスタンス（クラスを基に作られたオブジェクト）の作成
msg = Msg.new() # 
msg.hello("Taro") #<= Msgクラスを基にしたインスタンス（オブジェクト）msgを作成し、その中のhelloを呼び出している
msg.bye("Hanako")