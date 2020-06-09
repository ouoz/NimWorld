import sequtils, strutils, algorithm, math, future, sets, tables, hashes, intsets, heapqueue
let read = iterator : string {.closure.} = (while true : (for s in stdin.readLine.split : yield s))


const n = 1000

var
  adj = newseq[tuple[d, t: int]](n)
  dist = newseqwith(n, int.high)
  used = newseqwith(n, false)

proc dijkstra(s: int) = 
  dist[s] = 0
  Q.push((0, s))
  while Q.len != 0:
    var
      cur = Q.pop
    if used[cur.t]: continue
    used[cur.t] = true; dist[cur.t] = cur.d
    for e in adj[cur.t]:
      if dist[e.t] <= cur.d + e.first: continue
      Q.push((cur.d + e.first, e.t))


