require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe '#age' do
  it 'returns the correct age' do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.age).to eql 23
  end
end

describe '#name' do
  it 'returns the correct age' do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.name).to eql 'Diego'
  end
end

describe '#id' do
  it 'returns a random id' do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.id).to be_kind_of(Integer)
    expect(person.id).to be_between(1, 1000).inclusive
  end
end

describe '#parent_permission' do
  it 'returns parent_permission to be false' do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.parent_permission).to be false
  end
end

describe '#parent_permission' do
  it 'returns parent_permission to be true if not defined' do
    person = Person.new(age: 23, name: 'Diego')
    expect(person.parent_permission).to be true
  end
end

describe '#can_use_services' do
  it 'returns can_use_services to be true because of age>18' do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.can_use_services?).to be true
  end
end

describe '#can_use_services' do
  it 'returns can_use_services to be true because of parent_permission' do
    person = Person.new(age: 12, name: 'Diego', parent_permission: true)
    expect(person.can_use_services?).to be true
  end
end

describe '#can_use_services' do
  it 'returns can_use_services to be false' do
    person = Person.new(age: 12, name: 'Diego', parent_permission: false)
    expect(person.can_use_services?).to be false
  end
end

describe '#correct_name' do
  it 'returns the name unchanged' do
    person = Person.new(age: 12, name: 'diego', parent_permission: false)
    expect(person.correct_name).to eql 'diego'
  end
end

describe '#correct_name' do
  it 'returns the name capitalized' do
    person = Person.new(age: 12, name: 'diego', parent_permission: false)
    person = CapitalizeDecorator.new(person)
    expect(person.correct_name).to eql 'Diego'
  end
end

describe '#correct_name' do
  it 'returns the name trimmed to 10 character' do
    person = Person.new(age: 12, name: 'diegoignacious', parent_permission: false)
    person = TrimmerDecorator.new(person)
    expect(person.correct_name).to eql 'diegoignac'
  end
end
