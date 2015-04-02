require './arrays'
require './array'
require 'benchmark'
include Benchmark

long = LONG
puts long.shuffle!.to_s
puts long.merge_sort!.to_s

n = 100
Benchmark.benchmark(CAPTION, 4, FORMAT, "total: ", "avg: ") do |x|
  total = x.report do 
      n.times do
        l1 = Array.new(long)
        l1.merge_sort!
      end
    end
  [total, total/n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "total: ", "avg: ") do |x|
  total = x.report do 
      n.times do
        l1 = Array.new(long)
        l1.sort
      end
    end
  [total, total/n]
end

