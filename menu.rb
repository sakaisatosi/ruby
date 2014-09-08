=begin

メニューコードを0,1,2と数え上げていき、トランザクションデータに変換するスクリプト

=end

df = open("data.csv")

#ヘッダースキップ
df.gets

i = 0
cData = [] #メニューコードを作るためのデータ
code = [] #メニューコード
result = [] #出力するためのもの	

for j in 0..136
    result[j] = 0
end

while line = df.gets
    cData[i] = line.split(",")
    code[i] = cData[i][1].to_i #メニューコード
    i += 1
end

suCode = code.sort.uniq

=begin
for m in 0..136
    print suCode[m],","
end
=end


#suCode[136] = "a"
df.close
df = open("data.csv")

tmp = 0 #何も読んでないときの変数
data = [] #splitしたものを入れる
profit = 0 #一回の買い物の売上

while line = df.gets
    data[i] = line.split(",")
    data[i][6].chomp! #改行を取り除く
    #p data[i]
    # 時刻が違ったら前のデータを出力
    if tmp == 0
	result[136] = data[i][0].to_i #時刻
	result[137] = data[i][2].to_i#売上種別
	result[138] = data[i][3].to_i #客層
	result[139] = data[i][6].to_i #POS-NO
	tmp = data[i][0] #時刻
	result[suCode.index(data[i][1].to_i)] = data[i][4].to_i #数量
	profit += data[i][5].to_i * data[i][4].to_i #数量*売上
    elsif tmp == data[i][0]
	result[suCode.index(data[i][1].to_i)] = data[i][4].to_i #数量
	profit += data[i][5].to_i * data[i][4].to_i #数量*売上
    else 
	tmp = 0

	for l in 0..138
	    print result[l],","
	end
	print result[139],",",profit

	# resultをリセットする
	for k in 0..139
	    result[k] = 0
	end
=begin
	for l in 0..138
	    print result[l],","
	end
	print result[139],",",profit

	# resultをリセットする
	for k in 0..139
	    result[k] = 0
	end
=end
	# profitをリセットする
	profit = 0
	print "\n"
    end
end

df.close

