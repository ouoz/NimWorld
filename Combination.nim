import math

const MAX = 5 * 10 ^ 6
const MOD = 10 ^ 9 + 7


var
  fac: array[MAX, int]
  finv: array[MAX, int]
  inv: array[MAX, int]

proc COMinit() = 
  fac[0] = 1
  fac[1] = 1
  finv[0] = 1
  finv[1] = 1
  inv[1] = 1
  for i in 2 ..< MAX:
    fac[i] = fac[i - 1] * i mod MOD
    inv[i] = MOD- inv[MOD mod i] * (MOD div i) mod MOD
    finv[i] = finv[i - 1]* inv[i] mod MOD

proc COM(n, k: int): int = 
  if n < k:
    return 0
  if n < 0 or k < 0:
    return 0
  return fac[n] * (finv[k] * finv[n - k] mod MOD) mod MOD

COMinit()
