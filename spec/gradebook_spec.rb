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
    expect(@gradebook.courses).to eq([@course1, @course2, @course3])
  end

  it "can list all students" do
    @course2.enroll(@student1)
    @course2.enroll(@student2)
    @course2.enroll(@student3)
    @gradebook.add_course(@course2)

    expect(@gradebook.list_all_students).to eq({@course2 => @course2.students})
    
    @course3.enroll(@student2)
    @course3.enroll(@student3)
    @course3.enroll(@student4)
    @gradebook.add_course(@course3)
    
    expect(@gradebook.list_all_students).to eq({@course2 => @course2.students, @course3 => @course3.students})
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
    
    @course2.enroll(@student1) # 76.5
    @course2.enroll(@student2) # 93.5
    @gradebook.add_course(@course2)
    
    expect(@gradebook.students_below(78).length).to eq(1)
    expect(@gradebook.students_below(78)).to eq([@student1])
    
    @student3.log_score(97)
    @student3.log_score(92)
    @student3.log_score(89)
    @student3.log_score(98)
    @student3.log_score(99)
    
    @student4.log_score(89)
    @student4.log_score(86)
    @student4.log_score(92)
    @student4.log_score(83)
    @student4.log_score(77)
    
    @course3.enroll(@student3) # 95.0
    @course3.enroll(@student4) # 85.4
    @gradebook.add_course(@course3)

    expect(@gradebook.students_below(90)).to eq([@student1, @student4])
  end
  
end