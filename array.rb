class Array
  def merge_sort!
    return self if self.length <= 1
    # else make 2 new arrays and sort them
    mid = self.length / 2
    s1 = self.slice(0...mid).merge_sort!
    s2 = self.slice(mid...self.length).merge_sort!

    #merge both arrays
    sl = self.length
    (0..sl).each do |s|
      if s1.empty? && s2.empty?
        break
      elsif s1.empty?
        self[s] = s2.shift.to_i
      elsif s2.empty?
        self[s] = s1.shift.to_i
      else
        self[s] = (s1[0] < s2[0] ? s1.shift.to_i : s2.shift.to_i)
      end
    end
    self
  end
end
