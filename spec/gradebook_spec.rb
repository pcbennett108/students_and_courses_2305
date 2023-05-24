require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do 
  before(:each) do
    @gradebook = Gradebook.new("Emmett Brown")
    @course1 = Course.new("Calculus", 2)
    @course2 = Course.new("Art", 4)
    @course3 = Course.new("Statistice", 3)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Jenda", age: 25})
    @student4 = Student.new({name: "Pat", age: 27})
  end

  it "exists" do
    expect(@gradebook).to be_instance_of(Gradebook)
  end

  it "has an instructor" do
    expect(@gradebook.instructor).to eq("Emmett Brown")
  end

  it "starts with no courses" do
    expect(@gradebook.courses).to eq([])
  end

  it "can add courses" do
    @gradebook.add_course(@course1)
    @gradebook.add_course(@course2)
    @gradebook.add_course(@course3)
    expect(@gradebook.courses.length).to eq(3)
  end

  it "can list all students" do
    @course2.enroll(@student1)
    @course2.enroll(@student2)
    @course2.enroll(@student3)
    @gradebook.add_course(@course2)

    expect(@gradebook.list_all_students).to eq({@course2 => @course2.students})
  end

  it "can show students below threshold" do
    @student1.log_score(89)
    @student1.log_score(79)
    @student1.log_score(49)
    @student1.log_score(89)

    @student2.log_score(99)
    @student2.log_score(88)
    @student2.log_score(92)
    @student2.log_score(95)

    @course2.enroll(@student1)
    @course2.enroll(@student2)
    @gradebook.add_course(@course2)
    students_below = students_below(75)

    expect(@gradebook.students_below.length).to eq(1)

  end



end