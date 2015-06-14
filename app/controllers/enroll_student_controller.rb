class EnrollStudentController < ApplicationController
  before_action :set_course, only: [:create, :new]

  def new
    @url = url_for(:controller => 'enroll_student', :action => 'create')
    @student = current_user.students.new
  end

  def create
    @student = current_user.students.new student_params
    if @student.save
      @enrollment = current_user.course_enrollments.new :student_id => @student.id, :course_id => @course.id
      if @enrollment.save
        respond_with @course
      end
    else
      render :new
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade_level, :birth_month, :birth_day, :birth_year)
  end

  def authorized_user
    @course = current_user.courses.find_by(id: params[:id])
    @student = current_user.students.find_by(id: params[:id])
    redirect_to courses_path, notice: "Not authorized to modify that course or student" if @course.nil?
  end
end
