class Array
  def merge_sort
    return self if self.length <= 1
    # else make 2 new arrays and sort them
    mid = self.length / 2
    s1 = self.slice(0...mid).merge_sort
    s2 = self.slice(mid...self.length).merge_sort

    # merge both arrays
    return s1 + s2 if s1.last < s2.first

    result = []
    until s1.empty? || s2.empty?
      result << (s1[0] <= s2[0] ? s1.shift : s2.shift)
    end
      result + s1 + s2
  end



  # the inplace version
  def merge_s!
    return self if self.length <= 1

    sl = self.length
    # go from 1 to log(n)

    (0..Math.log(sl).to_i).each do |k|
      offset = 2**k
      # puts "offset:" + offset.to_s

      first = 0
      # iterate through entire array
      while first < sl do
        second = (first + offset / 2.0).ceil.to_i
        break if second >= self.length

        # puts "first:" + first.to_s + ",  second:" + second.to_s
        
        if self[first] > self[second]
          # puts "swap"
          tmp = self[first]
          self[first] = self[second]
          self[second] = tmp
        end   
        puts self.to_s     

        first += offset
      end
    end
    self
  end























  # the inplace version
  def merge_in_place!
    return self if self.length <= 1

    sl = self.length
    # go from 1 to log(n)

    (0..Math.log(sl).to_i).each do |k|
      offset = 2**k
      first = 0
      # iterate through entire array
      while first < sl do
        second = (first + offset / 2.0).ceil.to_i
        break if second >= self.length

        # already sorted
        unless self[second - 1] < self[second]
          f = first
          s = second
          result = []
          # iterate through a section of the array
          until (f >= s || (self[s].nil? || self[f].nil?) )
            if self[f] <= self[s]
              result << self[f]
              f += 1
            else
              result << self[s]
              s += 1
            end 
          end
          # push the rest of the array
          result += self.slice(f, second) + self.slice(s, first + offset)

          # put result values back into self
          rl = result.length
          (0..rl).each do |index|
            self[first + index] = result[index]
          end
        end

        first += offset
      end
    end
    self
  end
end
