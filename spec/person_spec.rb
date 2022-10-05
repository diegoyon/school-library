require_relative '../person'

describe "#age" do
  it "returns the correct age" do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.age).to eql 23
  end
end

describe "#name" do
  it "returns the correct age" do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.name).to eql 'Diego'
  end
end

describe "#id" do
  it "returns a random id" do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.id).to be_kind_of(Integer)
    expect(person.id).to be_between(1,1000).inclusive
  end
end

describe "#parent_permission" do
  it "returns parent_permission to be false" do
    person = Person.new(age: 23, name: 'Diego', parent_permission: false)
    expect(person.parent_permission).to be false
  end
end

describe "#parent_permission" do
  it "returns parent_permission to be true if not defined" do
    person = Person.new(age: 23, name: 'Diego')
    expect(person.parent_permission).to be true
  end
end