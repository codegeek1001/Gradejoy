class CourseAssignmentController < ApplicationController
  before_action :set_course, only: [:create, :new]

  def new
    @url = url_for(:controller => 'course_assignment', :action => 'create')
    @assignment = current_user.assignments.new
  end

  def show
    @assignment = current_user.assignments
    @course_assignment = current_user.course_assignments
    respond with(@course_assignment)
  end

  def create
    @assignment = current_user.assignments.new assignment_params
     if @assignment.save
       @course_assignment = current_user.course_assignments.new :assignment_id => @assignment.id, :course_id => @course.id
       if @course_assignment.save
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

  def assignment_params
    params.require(:assignment).permit(:title, :date_created, :date_due, :category, :total_points)
  end

  def authorized_user
    @course = current_user.courses.find_by(id: params[:id])
    redirect_to courses_path, notice: "Not authorized to edit that course" if @course.nil?
  end

end
