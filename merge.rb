require './arrays'
require './array'
require 'benchmark'
include Benchmark

long = LONG
# puts long.shuffle!.to_s

n = 100
Benchmark.benchmark(CAPTION, 4, FORMAT, "total: ", "avg: ") do |x|
  total = x.report do 
      n.times do
        l1 = long
        l1.merge_sort!
      end
    end
  [total, total/n]
end
