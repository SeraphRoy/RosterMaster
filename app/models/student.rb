class Student < ActiveRecord::Base
  resourcify

  has_and_belongs_to_many :courses

  def self.get_student(student)
    email = student.email
    studentid = student.studentid
    s = Student.where(studentid: studentid).first
    if s.nil?
      s = Student.new_student(params)
    elsif s.email != email
      if not Student.where(email: email).exists?
        # Keep our student roster up to date with registrar, and update all items
        s.email = email
        s.first_name = params[:first_name]
        s.last_name = params[:last_name]
        s.save
      else
        return "The student could not be added."
      end
    end
  end
end
