class Student

  GOOD_GRADE_AVERAGE = 85
  ANNUAL_INCOME_POVERTY_LIMIT = 15_000

  attr_reader :name, :id, :anual_income

  def initialize(name:, id:, anual_income:)
    @name = name
    @id = id
    @anual_income = anual_income
    @grades = []
  end

  def add_grade(grade)
    @grades << grade
    self
  end

  def display_info
    display_personal_information
    display_disclaimer
  end

  def scholarship_worthy?
    raise 'Student has no grades' if @grades.empty?

    has_good_grades = average >= GOOD_GRADE_AVERAGE
    is_poor = @anual_income < ANNUAL_INCOME_POVERTY_LIMIT
    has_good_grades and is_poor
  end

  private

  def display_personal_information
    puts "Name: #{ @name } ID: #{ @id }"
    puts "Anual income: #{ @anual_income }"
    puts "Grade average: #{ average }"
  end

  def display_disclaimer
    puts 'The contents of this class must not be considered an offer,'
    puts 'proposal, understanding or agreement unless it is confirmed'
    puts 'in a document signed by at least five blood-sucking lawyers.'
  end

  def average
    grade_sum = 0
    @grades.each do |grade|
      grade_sum += grade
    end
    grade_sum / @grades.size.to_f
  end

end
