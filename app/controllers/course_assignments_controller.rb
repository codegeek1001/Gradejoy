class CourseAssignmentsController < ApplicationController
  before_action :set_course, only: [:create, :new]
  before_action :set_course_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorized_user, except: [:index, :new, :create]
  respond_to :html, :js, :xml, :json

  def index
    @course_assignments = current_user.course_assignments
    respond_with(@course_assignments)
  end

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

  def set_course_assignment
    @course_assignment = CourseAssignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :date_created, :date_due, :category, :total_points)
  end

  def course_assignment_params
    params.require(:course_assignment).permit(:course_id, :assignment_id, :user_id)
  end

  def authorized_user
    @course_assignments = current_user.course_assignments.find_by(id: params[:id])
    redirect_to courses_path, notice: "Not authorized to edit that course" if @course_assignment.nil?
  end

end
