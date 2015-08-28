# クラスメソッド: クラスから直接呼び出して実行できるメソッドのこと
#   例: .newなど

# coding: utf-8
class Exchange
  @@rate = 100
  
  def self.rate   # .rateの呼び出しの時、rateが指定されなかった場合
    return @@rate # @@rateは100になる
  end
  def self.rate= rate# .rateの呼び出しの時、rateが指定された場合
    @@rate = rate.to_f
  end
  
  def self.YtoD yen
    d = (yen / @@rate).to_i
    c1 = yen % @@rate
    c = (c1 / @@rate * 100).to_i
    return d.to_s + "ドル" + c.to_s + "セント"
  end
  def self.DtoY d,c
    y1 = d * @@rate
    y2 = (c * @@rate) / 100
    y = (y1 + y2).to_i
    return y.to_s + "円"
  end
end

Exchange.rate = 85 #<= @@rate = 85に決定
d = Exchange.YtoD(12300)
puts '12300円は、' + d + 'です。'
y = Exchange.DtoY(123,99)
puts '123ドル99セントは、' + y + 'です。'
  
# クラスメソッドの書き方

# 1)
# def (クラス), (メソッド)
# （処理）
# end

# 2)
# def self(クラス), (メソッド)
# （処理）
# end

# self: オブジェクトで自分自身を示す特別な値
#   =>メソッドの定義で使えばクラス自身を示し、インスタンスメソッド内の処理で利用すればそのインスタンス自身を示すことができる

# インスタンス変数が使えないため、クラス変数 @@をつけて値を保持
# インスタンスメソッドからも利用でき、どのインスタンスでも常に同じ値になるため、クラスそのものの設定情報などを補完するのに便利
