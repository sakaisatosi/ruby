require 'rubygems'
require 'ai4r'
require 'csv'

# XORを出力するNN(入力2 出力1 hidden layer 1層3個)
net = Ai4r::NeuralNetwork::Backpropagation.new([2,3,1])

CSV.open("hoge.csv",'w'){|csv| #学習時の誤差をCSVに出力する
    # 30000回の学習を行う
    30000.times { |i|
	a = rand(2) # 0 or  1(Integer)
	b = rand(2)
	net.train([a,b],[a^b]) # inputと期待されるoutputを入力して学習させる 
	err = (a^b) - net.eval([a,b])[0] # 誤差の計算
	puts "[#{i}] #{err.abs}"
	csv << [i, err.abs]
    }
}

#学習結果の出力
puts "input(0,0) output: #{net.eval([0,0])}"
puts "input(0,1) output: #{net.eval([0,1])}"
puts "input(1,0) output: #{net.eval([1,0])}"
puts "input(1,1) output: #{net.eval([1,1])}"
    
