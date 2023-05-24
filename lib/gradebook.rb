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
    students_list = []
    self.list_all_students.each do |student|
      if student.grade < threshold
        students_list << student
      end
    end
    students_list
  end

end
