class CreateAssignmentAndCourseAssignmentController < ApplicationController
  before_action :set_course
  before_filter :authenticate_user!
  respond_to :html, :js, :xml, :json

  def new
    @url = url_for(:controller => 'create_assignment_and_course_assignment', :action => 'create')
    @assignment = current_user.assignments.new
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
    params.require(:assignment).permit(:name, :date_due, :category, :total_points)
  end
end
