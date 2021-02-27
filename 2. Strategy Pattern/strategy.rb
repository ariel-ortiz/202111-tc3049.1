class Student

  attr_reader :id, :name, :gender, :gpa

  def initialize(id, name, gender, gpa)
    @id = id
    @name = name
    @gender = gender
    @gpa = gpa
  end

end

class StudentStrategy

  def execute(array)
    raise 'Abstract method called!'
  end

end

class Course

  def strategy=(new_strategy)
    if !new_strategy.is_a? StudentStrategy
      raise 'Invalid argument. Was expecting a StudentStrategy.'
    end
    @strategy = new_strategy
  end

  def initialize
    @students = []
    @strategy = nil
  end

  def add_student(student)
    @students.push(student)
  end

  def execute
    @strategy.execute(@students)
  end

end

class CountGenderStrategy < StudentStrategy

  def initialize(gender)
    @gender = gender
  end

  def execute(array)
    array.count {|e| e.gender == @gender}
  end

end

class ComputeAverageGPAStrategy < StudentStrategy

  def execute(array)
    return nil if array.empty?
    array.sum {|e| e.gpa} / array.length
  end

end

class BestGPAStrategy < StudentStrategy

  def execute(array)
    return nil if array.empty?
    (array.max_by {|e| e.gpa}).name
  end

end
