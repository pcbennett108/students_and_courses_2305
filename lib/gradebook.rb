require './lib/course'
require './lib/student'
require 'pry'

class Gradebook
  attr_reader :instructor, :courses
  def initialize(name)
    @instructor = name
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    student_list = {}
    @courses.each do |course|
      student_list[course] = course.students
    end
    student_list
  end

  def students_below(threshold)
    students_below_threshold = []
    list_all_students.keys.each do |course|
      list_all_students[course].each do |student|
        students_below_threshold << student unless student.grade > threshold
      end
    end
    students_below_threshold
  end

end
