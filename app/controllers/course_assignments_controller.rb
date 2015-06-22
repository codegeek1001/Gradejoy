class CourseAssignmentsController < ApplicationController
  before_action :set_course_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorized_user, except: [:index, :new, :create]
  respond_to :html, :js, :xml, :json

  def index
    @course_assignments = current_user.course_assignments
    respond_with(@course_assignments)
  end

  def new
    @course_assignment = current_user.course_assignments.new
    @courses = current_user.courses
    @assignments = current_user.assignments
  end

  def show
  end

  def create
    @course_assignment = current_user.course_assignments.new(course_assignment_params)
    @course_assignments = current_user.course_assignments

     if @course_assignment.save
       #redirect_to course_assignments_path
       respond_with(@course_assignments)
     else
       render :new
     end
  end

  def update
    if @course_assignment.update(course_assignment_params)
      redirect_to course_assignments_path
    else
      render :edit
    end
  end

  private

  def set_course_assignment
    @course_assignment = CourseAssignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :date_due, :category, :total_points)
  end

  def course_assignment_params
    params.require(:course_assignment).permit(:course_id, :course_ids, :assignment_id, :user_id)
  end

  def authorized_user
    @course_assignments = current_user.course_assignments.find_by(id: params[:id])
    redirect_to courses_path, notice: "Not authorized to edit that course" if @course_assignment.nil?
  end

end
