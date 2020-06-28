import sequtils, strutils, algorithm, math, future, sets, tables, hashes, intsets
let read = iterator : string {.closure.} = (while true : (for s in stdin.readLine.split : yield s))


var
    d = read().parseint
    c = newseqwith(26, read().parseint)
    s = newseqwith(d, newseqwith(26, read().parseint))
    curd = 0
    last = newseqwith(26, -1)

while true:
    for i in 0 ..< 26:
        if last[i] != -1:
            