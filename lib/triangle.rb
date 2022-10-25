class Triangle
  # write code here
  attr_reader :a,:b,:c
  
  def initialize (a,b,c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    triangle_type
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

    def triangle_type
      actual_triangle = [(a + b > c), (a + c > b), (b + c > a)]
      [a, b, c].each {|x| actual_triangle << false if x <= 0 }
      raise TriangleError if actual_triangle.include?(false)
    end

    class TriangleError < StandardError
    end
end
