# Find

* [Example code in Io's repo](https://github.com/stevedekorte/io/tree/master/samples/misc)
* [Official docs tutorial (example problems)](http://iolanguage.org/tutorial.html)
* [Official style guide](http://iolanguage.org/guide/guide.html)
* [Unofficial style guide](https://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide)
* [Io github issues](https://github.com/stevedekorte/io/issues)
* [Yahoo group (no activity since 2015)](https://groups.yahoo.com/neo/groups/iolanguage/info)

# Answer
* Evaluate 1 + 1 and then 1 + "one". Is Io strong typed or weakly typed? Support your answer with code.
  * Strongly typed; trying to add together a number and a string throws an exception
  ```io
    Io> 1 + "one"

    Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
    ---------
    message '+' in 'Command Line' on line 1

  ```
* Is `0` true of false? What about the empty string? Is `nil` true or false? Support your answer with code.
  * `0` is false
  * `''` is true
  * `nil` is false
  ```io
  if (false, "0 is true" print)
  ==> false
  if (true, "0 is true" print)
  0 is true==> 0 is true

  if (0, "0 is true" print)
  0 is true==> 0 is true

  if ("", "'' is true" print)
  '' is true==> '' is true

  if (nil, "nil is true" print)
  ==> false
  ```
* How can you tell what slots a prototype supports?
  * use the `slotNames` method

* What is the different between `=` (equals), `:=` (colon equals), and `::=` (colon colon equals)? When would you use each one?
  * `=` assigns value to slot if it exists, otherwise raises exception
  * `:=` creates slot, assigns value
  * `::=` creates slot, creates setter, assigns value

# Do
* Run an Io program from a file. (`io [FILENAME HERE].io`)

* Execute the code in a slot given its name.
