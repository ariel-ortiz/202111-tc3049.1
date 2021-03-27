a = [4, 8, 15, 16, 23, 42]

# Iteración tradicional
a.each {|e| puts e}
puts

# La clase Enumerator
# Permite iterar sobre cualquier objeto (colección)
# y cuenta con soporte para iteradores internos y
# externos. Adicionalmente provee soporte para crear
# Generators.

iter = a.to_enum

# Iterador externo
puts iter.next
puts iter.next
puts iter.next
puts iter.next

puts 'rewind...'
iter.rewind

puts iter.next
puts iter.next
puts iter.next
puts iter.peek
puts iter.peek
puts iter.peek
puts iter.next
puts

# Iterador interno
iter.each {|e| puts e}
p iter.filter {|e| e % 2 == 0}
puts

# Generators
gen = Enumerator.new do |yielder|
  x = 1
  yielder << x
  x *= 2
  yielder << x
  x *= 10
  yielder << x
end

puts gen.next
puts gen.next
puts gen.next
gen.rewind
puts gen.next
puts

gen2 = Enumerator.new do |yielder|
  i = 1
  while true
    yielder << i
    i *= 2
  end
end

puts gen2.next
puts gen2.next
puts gen2.next
puts gen2.next
p (gen2.take 10).drop 5
p gen2.take_while {|e| e < 10_000}

puts

it = [1, 2, 3].to_enum
while true
  begin
    puts  it.next
  rescue StopIteration
    break
  end
end

puts

it.rewind
loop do
  puts it.next
end
