require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true, id: rand(1..1000))
    super(
      name: name,
      age: age,
      parent_permission: parent_permission,
      id: id
    )
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
