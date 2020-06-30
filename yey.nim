import sequtils, strutils, algorithm, math, future, sets, tables, hashes, intsets
let read = iterator : string {.closure.} = (while true : (for s in stdin.readLine.split : yield s))


const Mod = 1000000007
const LowZ = int.low div Mod*Mod
type mint = distinct int
converter toMint*(a: int): mint = mint((a-int(a<0)*LowZ)mod Mod)
proc `+`(a,b: mint): mint = a.int + b.int
proc `+=`(a: var mint; b: mint) = a = a + b
proc `*`(a,b: mint): mint = a.int * b.int
proc pow(a: mint, x: int): mint =
  assert(x >= 0)
  var
    res = 1.toMint
    base = a
    exp = x
  while exp > 0:
    if (exp and 1) == 1:
      res = res * base
    base = base * base
    exp = exp div 2
  return res
proc inv(a: mint): mint = pow(a, Mod - 2)
proc `div`(a, b: mint): mint = a * inv(b)
proc `$`(a: mint): string {.borrow.}



template yieldCombination(n: int = 20) =
  var
    fac {.inject.} = newSeq[mint](n)
    inv {.inject.} = newSeq[mint](n)
  fac[0] = 1.toMint
  for i in 1..<n:
    fac[i] = i.toMint * fac[i - 1]
  inv[n - 1] = 1.toMint div fac[n - 1]
  for i in countdown(n - 2, 0):
    inv[i] = inv[i + 1] * (i + 1).toMint
  let binom {.inject.} =
    proc(a, b: int): mint =
      if a < 0 or b < 0: return 0.toMint
      if a < b: return 0.toMint
      return fac[a] * inv[b] * inv[a - b]



var
  n, m = read().parseint
  
