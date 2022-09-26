class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name: 'Unknown', age:, parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18 
  end
end
