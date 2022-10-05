require_relative '../teacher.rb'

describe "#age" do
  it "returns the correct age" do
    teacher = Teacher.new(specialization: 'math', age:25, name: 'Omar')
    expect(teacher.age).to eql 25
  end
end

describe "#specialization" do
  it "returns the correct specialization" do
    teacher = Teacher.new(specialization: 'math', age:25, name: 'Omar')
    expect(teacher.specialization).to eql 'math'
  end
end

describe "#name" do
  it "returns the correct name" do
    teacher = Teacher.new(specialization: 'math', age:25, name: 'Omar')
    expect(teacher.name).to eql 'Omar'
  end
end

describe "#can_use_services?" do
  it "returns the correct can_use_services? value" do
    teacher = Teacher.new(specialization: 'math', age:14, name: 'Omar')
    expect(teacher.can_use_services?).to be true
  end
end