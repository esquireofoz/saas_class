class CartesianProduct
  include Enumerable

  def initialize(array_a, array_b)
    @cartesian_array = Array.new(0)
    array_a.each do |element_a|
      array_b.each do |element_b|
        tmp_array = Array.new(0)
        tmp_array.push(element_a,element_b)
        @cartesian_array.push(tmp_array)
      end
    end
    @cartesian_array
  end

  def each
    @cartesian_array.each { |index| yield(index) }
  end

end
