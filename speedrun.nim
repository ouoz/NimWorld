import sequtils, strutils, algorithm, math, future, sets, tables, hashes, intsets
let read = iterator : string {.closure.} = (while true : (for s in stdin.readLine.split : yield s))



#累積和

var
    n = read().parseint
    a = newseqwith(n, read().parseint)
    acm = newseqwith(n + 1, 0)

for i in 0 ..< n:
    acm[i + 1] = a[i] + acm[i]




#二分探索

var
    n = read().parseint
    a = newseqwith(n, read().parseint)

proc isok(mid: int): bool = 
    if mid <= 1000:
        return true
    else:
        return false

var
    ok = 0
    ng = 100000000
while abs(ok - ng) > 1:
    var
        mid = (ok + ng) div 2
    if isok(mid):
        ok = mid
    else:
        ng = mid





#選択ソート
var
    n = read().parseint
    a = newseqwith(n, read().parseint)

for i in 0 ..< n - 1:
    for j in i + 1 ..< n:
        if a[i] > a[j]:
            swap(a[i], a[j])




#ビット全探索
var
    n = read().parseint
    a = newseqwith(n, read().parseint)

var
    p = 1 shl n

for i in 0 ..< p:
    var 
        bit = i
        sum = 0 
    for j in 0 ..< n:
        if bit mod 2 == 1:
            sum += a[j]
        bit = bit div 2






#nextPermutation

var
    n = read().parseint
    a = read().parseint

while true:
    echo a
    if not a.nextPermutation:
        break





#BFS

var
    n,m = read().parseint
    G = newseqwith(n, newseqwith(n, read().parseint))

for i in 0 ..< m:
    var
        a,b = read().parseint - 1
        c = read().parseint
    G[a][b] = c
    G[b][a] = c

var
    used = newseqwith(n, 0)
proc bfs(cur: seq[tuple[dist, node: int]]) = 
    var
        next = newseq[tuple[dist, node: int]]()
    for val in cur:
        for i in 0 ..< n:
            if G[val.node][i] != int.high and used[i] == 0:
                next &= (val.dist + G[val.node][i], i)
                used[i] = 1
    bfs(next)
bfs(@[(0, 0)])






#DFS



var
    n,m = read().parseint
    G = newseqwith(n, newseqwith(n, int.high))

for i in 0 ..< m:
    var
        a,b = read().parseint - 1
        c = read().parseint
    G[a][b] = c
    G[b][a] = c

var
    used = newseqwith(n, 0)
proc dfs(cur: int) = 
    for i in 0 ..< n:
        if G[cur][i] != int.high and used[i] == 0:
            used[i] = 1
            dfs(i)




#いもす

var
    t, m = read().parseint
    gate = newseqwith(t + 1, 0)
for i in 0 ..< n:
    var
        a,b = read().parseint
    gate[a] += 1
    gate[b] -= 1

var
    cur = 0
    maxv = int.low
for i in 0 .. t:
    cur += gate[i]
    maxv = max(maxv, cur)

echo maxv








#しゃくとり

var
    n = read().parseint
    a = newseqwith(n, read().parseint)
    maxv = 0
    cur = s[0]
var
    l = 0
    r = 1


while r < n:
    if cur * a[r] <= k:
        cur *= a[r]
        r += 1
    else:
        cur = cur div a[l]
        l += 1

    maxv = max(maxv, r - l)





#lower_bound

var
    n = read().parseint
    a = newseqwith(n, read().parseint)

proc lower_bound(ar: seq[int], val: int): int = 
    var
        ng = -1
        ok = ar.len
    while abs(ng - ok) > 1:
        var
            mid = (ng + ok) div 2
        if ar[mid] >= val:
            ok = mid
        else:
            ng = mid
    return ok




#ワーシャルフロイド

var
    n, m = read().parseint
    dist = newseqwith(n, newseqwith(n, int.high div 2))

for i in 0 ..< m:
    var
        a,b = read().parseint - 1
        c = read().parseint
    dist[a][b] = c
    dist[b][a] = c


for k in 0 ..< n:
    for i in 0 ..< n:
        for j in 0 ..< n:
            dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])





#UnionFind
var par : seq[int]
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




