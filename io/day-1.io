"Hello world" println

Cat := Object clone

Cat meow := method("meow" println)

Mia := Cat clone

Mia meow

((Mia proto) == Cat) println

sayHello := method("hello" println)

execute := method(name,
  # self println
  # call println
  self getSlot(name) call
)

execute("sayHello")
