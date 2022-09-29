require './nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @id = rand(1..1000)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

# require './capitalize_decorator'
# require './trimmer_decorator'

# person = Person.new(age: 22, name: 'maximilianus')
# p person.correct_name

# capitalized_person = CapitalizeDecorator.new(person)
# p capitalized_person.correct_name

# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# p capitalized_trimmed_person.correct_name
