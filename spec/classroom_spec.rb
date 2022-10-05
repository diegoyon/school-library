require_relative '../classroom.rb'
require_relative '../student.rb'

describe "#label" do
  it "returns the correct label" do
    classroom = Classroom.new('Computer Science')
    expect(classroom.label).to eql 'Computer Science'
  end
end

describe "#add_student" do
  it "checks if the student is added to the classroom" do
    classroom = Classroom.new('Computer Science')
    student = Student.new(name: 'Diego', age: 31, classroom: 'Math')
    classroom.add_student(student)
    expect(classroom.students).to include student
    expect(student.classroom).to be classroom
  end
end