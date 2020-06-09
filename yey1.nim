import sequtils, strutils, algorithm, math, future, sets, tables, hashes, intsets, heapqueue
let read = iterator : string {.closure.} = (while true : (for s in stdin.readLine.split : yield s))


var
  v = initheapqueue[int]()

for i in 0 ..< 10:
  v.push(i)

while v.len != 0:
  echo v.pop
  



