require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom:, age:, name: 'Unknown', parent_permission: true)
    super(
      name: name,
      age: age,
      parent_permission: parent_permission
    )
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

# require './classroom'

# diego = Student.new(classroom: 5, age: 10)
# p diego
# p diego.play_hooky
# p diego.can_use_services?
# p diego.classroom
# math = Classroom.new('math')
# p math
# math.add_student(diego)
# p '---'
# p math
# p '-----'
# p diego
