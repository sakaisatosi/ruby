df = open("mini.txt", "r") # read datafile
list = []
df.gets #1行目を飛ばす
i = 0

while line = df.gets
    list[i] = line.split(' ')
    p list[i][6]
    i += 1
end

df.close
