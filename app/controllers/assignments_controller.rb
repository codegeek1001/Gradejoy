class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorized_user, except: [:index, :new, :create]
  respond_to :html, :js, :xml, :json

  def index
    @assignments = current_user.assignments
    respond_with(@assignments)
  end

  def show
    @course_assignment = current_user.course_assignments.new
    @courses = current_user.courses
  end

  def new
    @assignment = current_user.assignments.new
  end

  def edit
  end

  def create
    @assignment = current_user.assignments.new(assignment_params)
    @assignments = current_user.assignments

    if @assignment.save
      redirect_to(:back)
    else
      render :new
    end
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to(:back)
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_path
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def course_assignment_params
      params.require(:course_assignment).permit(:course_id, :assignment_id, :user_id)
    end

    def assignment_params
      params.require(:assignment).permit(:name, :date_created, :date_due, :category, :total_points)
    end

    def authorized_user
      @assignment = current_user.assignments.find_by(id: params[:id])
      redirect_to courses_path, notice: "Not authorized to view that assignment" if @assignment.nil?
    end
end
