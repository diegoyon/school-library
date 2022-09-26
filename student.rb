require './person.rb'

class Student < Person
  def initialize (name="Unknown", age, classroom)
    super(name,age)
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end
end