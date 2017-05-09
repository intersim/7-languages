#Day 2 Self-Study

# Do:

# 1. A Fibonacci sequence starts with two 1s. Each subsequent num- ber is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

# with loops
fib := method(num,
  start := list(0, 1)
  for(x, 1, num, 1,
    start append(start at(x - 1) + start at(x))
  )
  start at(num)
)

# fib(1) println
# fib(4) println
# fib(10) println

# with recursion
fib := method(num,
  if(num == 0 or num == 1, num, fib(num - 2) + fib(num - 1))
)

# fib(1) println
# fib(4) println
# fib(10) println

# # 2. How would you change / to return 0 if the denominator is zero?

divide := Number getSlot("/")
Number / = method(num, if(num == 0, 0, divide(num)))

# (7 / 0) println
# (1 / 2) println

# 3. Write a program to add up all of the numbers in a two-dimensional array.

sumTwoDArray := method(array,
  sum := 0
  for(i, 0, array size - 1, 1,
    if ((array at(i) type) == "Number",
        sum = sum + array at(i),
        sum = sum + sumTwoDArray(array at(i))
        )
  )
  sum
)

# sumTwoDArray(list(1, list(2, 3))) println

# 4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)

# 5. Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.

# 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.

# 7. Write the matrix to a file, and read a matrix from a file.

# 8. Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.

count := 0
guessNum := method(
  count = count + 1

  if (count == 10, return)

  num := Random value(1, 100) round
  num println

  guess := File standardInput readLine

  if (
    num < guess,

    "Too low! Guess again..." println,
    if (num == guess,
      "You got it! 🎊 🎊 🎊" println,
      "Too high! Guess again..." println
    )
  )
)

guessNum()
