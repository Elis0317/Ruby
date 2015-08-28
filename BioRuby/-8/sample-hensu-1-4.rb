###File-name:sample-hensu-1-4.rb

suuchi_s = "1234567890"
p suuchi_s

suuchi_i = 1234567890
p suuchi_i

wa = suuchi_s.to_i + suuchi_i
#---------------------------------------
#.to_iは変数をinteger型に変換するメソッド
#[.]によってメソッドをつなぐことが可能
#
#例 s = "123"
#   p s.to_i.to_s
#
#この時、表示される結果は"123"となる
#----------------------------------------
p wa