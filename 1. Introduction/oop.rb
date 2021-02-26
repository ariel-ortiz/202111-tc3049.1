class Student

  attr_reader :id

  def id=(new_id)
    if new_id >= 0
      @id = new_id
    else
      raise 'new_id must be positive!'
    end
  end

  def initialize(id, name)
    @id = id
    @name = name
  end

  def to_s
    "Student(#{@id}, #{@name})"
  end
end

s1 = Student.new(123, 'Juan')
puts s1.id
s1.id = 124
puts s1.id
# s1.id = -1

a = [s1, 42]
a.each do |x|
  puts "Class: #{x.class}, To String: #{x.to_s}"
end