type Monoid[T] = object
  op: proc(a,b: T): T
  id: T
type SegTree[T] = object
  tree: seq[T]
  size: int
  mon: Monoid[T]