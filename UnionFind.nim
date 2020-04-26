var 
  par: seq[int]
proc init(n : int) = 
  par = toSeq(0 .. n - 1)

proc root(x : int) : int = 
  if par[x] == x : 
    return x
  par[x] = root(par[x])
  return par[x]

proc same(x,y : int) : bool = 
  return root(x) == root(y)

proc unite(x,y : int) = 
  par[root(x)] = root(y)



#cunitacさんの実装
type DisjointSet = object
  rt: seq[int]
  rk: seq[int]
proc initDisjointSet(n: int): DisjointSet =
  DisjointSet(rt: toSeq(0..n-1), rk: 0.repeat n)
proc find(ds: var DisjointSet; a: int): int =
  if ds.rt[a] != a: ds.rt[a] = ds.find ds.rt[a]
  result = ds.rt[a]
proc unite(ds: var DisjointSet; a, b: int) =
  let x = ds.find a
  let y = ds.find b
  if x == y: return
  if ds.rk[x] < ds.rk[y]: ds.rt[x] = y
  else:
    ds.rt[y] = x
    if ds.rk[x] == ds.rk[y]: ds.rk[x] += 1
