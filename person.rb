class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name="Unknown", parent_permission=true, age)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    if is_of_age?
      return true
    else
      return false
    end
  end

  private

  def is_of_age?
    if @age >=18
      return true
    else
      return false
    end
  end
end

