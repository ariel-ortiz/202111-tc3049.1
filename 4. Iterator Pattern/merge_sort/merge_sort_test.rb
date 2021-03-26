require 'minitest/autorun'
require 'merge_sort'

class MergSortTest < Minitest::Test

  def sorted?(array)
    array.each_cons(2).all? {|a, b| a <= b}
  end

  def test_1
    a1 = [12, 14, 15, 15, 27, 35, 35, 38, 38, 40, 42, 45, 52, 52, 54,
          56, 56, 64, 72, 72, 73, 75, 76, 80, 81, 86, 90, 97, 98, 100]
    a2 = [1, 2, 7, 8, 8, 10, 11, 11, 17, 20, 20, 22, 27, 28, 31, 32, 32,
          33, 35, 37, 37, 37, 40, 40, 40, 42, 42, 47, 51, 53, 53, 57,
          58, 58, 60, 60, 62, 62, 67, 69, 71, 72, 80, 81, 82, 89, 92,
          94, 98, 99]
    a3 = merge(a1, a2)
    assert(sorted? a3)
  end

  def test_2
    assert(sorted? merge([], []))
  end

  def test_3
    assert(sorted? merge((1..100).to_a, []))
  end

  def test_4
    assert(sorted? merge([], (1..100).to_a))
  end

  def test_5
    assert(sorted? merge((1..100).to_a, (1..100).to_a))
  end

end