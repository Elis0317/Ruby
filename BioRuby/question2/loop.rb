#------------------------------
# 問1 ループ練習
# Hello World![改行]を5回表示させてください。
# print(或いはprintf,cout等)を5回コピーすれば当然可能ですが、
# ループ構文(for,while等)を利用して、print等は1回の使用にとどめてみてください。
# 
# 可能ならコマンドラインから入力を受け取って、n回表示するように改造してください。
# 何回目のHello World!かも表示してみてください。
#-----------------------------

print("Enter Int\n")

times = gets.chomp.to_i

for i in 1..times
	print("Hello,world!\s", i,"\n") 
end
