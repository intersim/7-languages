# How to access files with and without code blocks; what is benefit of code block?
# File class - open method
#Resource: http://benjamintan.io/blog/2015/03/28/ruby-block-patterns-and-how-to-implement-file-open/
# without block - get file handle, then have to remember to close the file!
# f = File.open('Leo Tolstoy - War and Peace.txt', 'w')
# f << "Well, Prince, so Genoa and Lucca"
# f << " are now just family estates of the Buonapartes."
# f.close

# blocks: abstract away pre-and post-processing? (would otherwise have to remember to manually close the file)
# second optional argument to the File open method
# File.open('Leo Tolstoy - War and Peace.txt', 'w') do |f|
#   f << "Well, Prince, so Genoa and Lucca"
#   f << " are now just family estates of the Buonapartes."
# end

# translate a hash to an array? translate arrays to hashes?
# hash's keys into array:
h = { "a" => 100, "b" => 200, "c" => 300, "d" => 400 }
h.keys #=> ["a", "b", "c", "d"]

# hash's values into array:
h = { "a" => 100, "b" => 200, "c" => 300 }
h.values   #=> [100, 200, 300]

# can you iterate through a hash?
# https://ruby-doc.org/core-2.1.0/Hash.html#method-i-each
# h.each do |key, array|
#   puts "#{key}-----"
#   puts array
# end

# what other common data structures do arrays support?

# # Print the contents of an array of sixteen numbers four numbers at a time, using just each. Now, do the same with each_slice in Enumerate.
# arr = []

# for i in 1..16
#   arr.push(i)
# end

# arr.each do |el|
#   idx = arr.index(el)
#   if idx % 4 == 0
#     puts "#{el} #{arr[idx + 1]} #{arr[idx + 2]} #{arr[idx + 3]}"
#   end
# end

# arr.each_slice(4).to_a.each {|a| print "#{a[0]} #{a[1]} #{a[2]} #{a[3]}\n"}

# arr.each_slice(4).to_a.each do |a|
#   (0..3).each {|i| print "#{a[i]}"}
#   puts "\n"
# end

# The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and array. You should be able to specify a tree like this:
# `{'grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {} }, 'uncle' => { 'child 3' => {}, 'child 4' => {} } }}

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

=begin
ruby_tree = Tree.new('Ruby',
  [
    Tree.new('Reia'),
    Tree.new('MacRuby')
  ])

puts 'Visiting a node'
ruby_tree.visit {|node| puts node.node_name}

puts 'visiting entire tree'
ruby_tree.visit_all {|node| puts node.node_name}
=end

# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.
