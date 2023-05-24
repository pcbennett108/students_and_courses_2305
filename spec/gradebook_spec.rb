require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do 
  before(:each) do
    @gradebook = Gradebook.new("Emmett Brown")
    @course = Course.new("Calculus", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
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

end