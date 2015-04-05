require './arrays'
require './array'
require 'benchmark'
include Benchmark

long = LONG
short = SHORT
puts short.shuffle!.to_s
puts short.merge_in_place!.to_s

=begin
n = 1
Benchmark.benchmark(CAPTION, 4, FORMAT, "total: ", "avg: ") do |x|
  total = x.report do 
      n.times do
        long.merge_sort
      end
    end
  [total, total/n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "total: ", "avg: ") do |x|
  li = Array.new(long)
  total = x.report do 
      n.times do
        long.sort
      end
    end
  [total, total/n]
end
=end

