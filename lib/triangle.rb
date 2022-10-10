class Triangle
  # write code here
  attr_reader :len1
  attr_reader :len2
  attr_reader :len3
  attr_reader :all_sides
  

  def initialize(len1, len2, len3)
    @len1 = len1
    @len2 = len2
    @len3 = len3
    @all_sides = [len1, len2, len3]
  end

  def kind 
    if self.real_sides? && self.real_triangle?
      if all_sides.uniq.length == 1
        :equilateral
      elsif all_sides.uniq.length == 2
        :isosceles
      else 
        :scalene
      end
    else 
      raise TriangleError
    end
  end

  def real_sides?
    good_sides = all_sides.select {|side| side > 0}
    good_sides.length == 3 

  end

  def real_triangle?
    if self.len1 >= self.len2 + self.len3 || self.len2 >= self.len1 + self.len3 || self.len3 >= self.len1 + self.len2
      false
    else
      true
    end

  end

  class TriangleError < StandardError
  end

end
