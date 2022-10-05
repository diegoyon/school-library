require_relative '../student'

describe "#age" do
  it "returns the correct age" do
    student = Student.new(classroom: 2, age:15, name: 'Luisa')
    expect(student.age).to eql 15
  end
end

describe "#classroom" do
  it "returns the correct classroom" do
    student = Student.new(classroom: 2, age:15, name: 'Luisa')
    expect(student.classroom).to eql 2
  end
end

describe "#name" do
  it "returns the correct name" do
    student = Student.new(classroom: 2, age:15, name: 'Luisa')
    expect(student.name).to eql 'Luisa'
  end
end

describe "#unknown" do
  it "returns name=unknown if not defined" do
    student = Student.new(classroom: 2, age:15)
    expect(student.name).to eql 'Unknown'
  end
end

describe "#play_hooky" do
  it "returns the correct drawing" do
    student = Student.new(classroom: 2, age:15, name: 'Luisa')
    expect(student.play_hooky).to eql '¯\(ツ)/¯'
  end
end