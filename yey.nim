import sequtils, strutils, algorithm, math, future, sets, tables, hashes, intsets, queues
let read = iterator : string {.closure.} = (while true : (for s in stdin.readLine.split : yield s))


var
  s = read()
  used = initQueue[tuple[a,b: int]]()
  temoto = 5
  combo = -1
  ans = 0
  charge = initQueue[int]()
  chargeflag = false
  pre = int.low

s = s & "----------"

for i in 0 ..< s.len + 10:
  var
    gabun = used.len
  for j in 0 ..< gabun:
    var v = used.dequeue
    if v.a <= i * 2:
      temoto += v.b
    else:
      used.enqueue((v.a, v.b)) 

  if charge.len != 0:
    var
      cur = charge.dequeue
    if cur <= i * 2:
      ans += 50 + combo div 10 * 5
      combo += 1
      chargeflag = false
    else:
      charge.enqueue cur

  if s[i] == 'N' and not chargeflag and pre != i - 1:
    combo += 1
    if temoto >= 1:
      temoto -= 1
      used.enqueue((i * 2 + 13, 1))
      ans += 10 + combo div 10
      pre = i
  elif s[i] == 'N' and not chargeflag and pre == i - 1:
    if temoto >= 1:
      temoto -= 1
      used.enqueue((i * 2 + 13, 1))
      ans += 10 + combo div 10
      combo += 1
  elif s[i] == 'C' and not chargeflag:
    if temoto >= 3:
      gabun = used.len
      temoto -= 3
      used.enqueue((i * 2 + 18, 3))
      charge.enqueue(i + 5)
      chargeflag = true
echo ans

