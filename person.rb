require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
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

require './capitalize_decorator.rb'
require './trimmer_decorator.rb'
person = Person.new(age:22, name: 'maximilianus')
p person.correct_name

capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name