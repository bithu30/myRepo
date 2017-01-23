// MAPS
// (Key,Value) Pair Storage aka Hash Table or Dictionary

scala> val mymap = Map(("a",1),("b",2),("c",3))

mymap: scala.collection.immutable.Map[String,Int] = Map(a -> 1, b -> 2, c
 -> 3)

// Lookups
scala> mymap("a")
res12: Int = 1

// Noneif not present
scala> mymap get "b"
res15: Option[Int] = Some(2)

// Temp additions on immutable
scala> mymap + ("z"->99)
res19: scala.collection.immutable.Map[String,Int] = Map(a -> 1, b -> 2, c
 -> 3, z -> 99)

// Mutable maps
scala> val mymutmap = collection.mutable.Map(("x",1),("y",2),("z",3))
mymutmap: scala.collection.mutable.Map[String,Int] = Map(z -> 3, y -> 2,
x -> 1)

// Permanent Additions
scala> mymutmap += ("new"->999)

res29: mymutmap.type = Map(z -> 3, y -> 2, x -> 1, new -> 999)

scala> mymutmap
res30: scala.collection.mutable.Map[String,Int] = Map(z -> 3, y -> 2, x -
> 1, new -> 999)

// A few useful methods
scala> mymap.keys
res34: Iterable[String] = Set(a, b, c)

scala> mymap.values
res35: Iterable[Int] = MapLike(1, 2, 3)
