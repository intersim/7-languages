=begin

Modify the CSV application to support an `each` method to return a `CsvRow` object. Use `method_missing` on that `CsvRow` to return the value for the column for a given heading.

For example, for the file:
one, two
lions, tigers

allow an API that works like this:

csv = RubyCsv.new
csv.each {|row| puts row.one}

This should print "lions".

=end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each(&block)
      @csv_contents.each do |row|
        csvRow = CsvRow.new(row)
        block.call csvRow
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class CsvRow
  def method_missing name, *args
    require 'numbers_in_words'
    column_idx = NumbersInWords.in_numbers(name) - 1
    @row_contents[column_idx]
  end

  def initialize(rowStr)
    @row_contents = rowStr[0].split(', ')
  end

  attr_accessor :row_contents
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts row.one}


