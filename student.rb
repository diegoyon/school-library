require './person'

class Student < Person
  def initialize(classroom:, age:, name:'Unknown', parent_permission:true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end


diego = Student.new(classroom: 5, age: 10)
p diego
p diego.play_hooky
p diego.can_use_services?