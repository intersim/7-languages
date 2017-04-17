# Ruby API: http://ruby-doc.org/

# Programming Ruby: The Pragmatic Programmer's Guide
# http://ruby-doc.com/docs/ProgrammingRuby/

# A method that substitutes part of a string: String.sub

# Regexes:
# https://ruby-doc.org/core-2.2.0/Regexp.html
# http://stackoverflow.com/questions/8783721/differences-between-ruby-1-9-and-javascript-regexp

# Ranges: https://ruby-doc.org/core-2.2.0/Range.html

puts "Hello, world."

"Hello, Ruby".index('Ruby')

10.times do
  puts "Emily"
end

for num in 1..10 do
  puts "This is sentence number #{num}"
end

def rando(num)
  puts "Guess the number between one and #{num}..."
  target = rand(num)
  guess = gets.to_i
  if guess < target
    puts "Too low! Guess again..."
    rando(num)
  elsif guess > target
    puts "Too high! Guess again..."
    rando(num)
  else
    puts "You got it!" if guess == target
  end
end

rando(10)

