import os

MAX_NAME_SIZE = 24

for dir in os.walk("tickflow"):
    for file in dir[2]:
        fn = dir[0] + "/" + file
        f = open(fn)
        i = 1
        for line in f:
            if line.startswith("//"):
                if line[2:].strip().startswith("async function "):
                    name = line[2:].strip().split(" ")[2]
                    pad = (MAX_NAME_SIZE // 8 - len(name) // 8) * "\t"
                    print("async function\t%s%s @ %s:%d" % (name, pad, fn, i))
                elif line[2:].strip().startswith("function "):
                    name = line[2:].strip().split(" ")[1]
                    pad = (MAX_NAME_SIZE // 8 - len(name) // 8) * "\t"
                    print("function\t%s%s @ %s:%d" % (name, pad, fn , i))
            i+=1