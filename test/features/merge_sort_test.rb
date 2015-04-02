require "test_helper"
require 'benchmark'
require './arrays'
require './array'

feature "When I give it a list numbers it sorts" do
  scenario "given a list of unsorted numbers, use merge sort to sort them" do
    long = LONG
    l = long.shuffle!
    l.merge_sort!.to_s
    l[0].to_i.must_be :<=, l[1].to_i
    l[1].to_i.must_be :<=, l[2].to_i
    l[2].to_i.must_be :<=, l[3].to_i
  end

  scenario "performance" do
    
  end
end
