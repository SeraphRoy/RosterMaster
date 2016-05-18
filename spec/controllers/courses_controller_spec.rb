require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  it "should change the course" do
    student = Student.new(:email => 'test@example.com', :studentid => '1234567', :first_name => 'foo', :last_name => 'bar')
    student.save
    # course = Course.new(:dept => 'CS', :num => '193', :desc => 'haha', :term => 'fall')
    # course.save
    controller.new
    controller.add_student student
    @course.students.should == nil
  end
end
