def prime?(x, list_of_primes)
  list_of_primes.each do |n|
    return true if n * n > x
    return false if x % n == 0
  end
end

primes = Enumerator.new do |yielder|
  so_far = []
  current = 2
  loop do
    if prime?(current, so_far)
      so_far << current
      yielder << current
    end
    current += 1
  end
end

# p primes.take_while {|x| x < 1000}
# p primes.take(1000).drop(999)
primes.each_with_index do |x, i|
  puts "#{i}.- #{x}"
end