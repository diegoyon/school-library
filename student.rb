require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown')
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
