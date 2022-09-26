require './person.rb'

class Teacher < Person
  def initialize (name = "Unknown", age, specialization)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    return true
  end
end

diego = Teacher.new('Diego', 10, 'math')
