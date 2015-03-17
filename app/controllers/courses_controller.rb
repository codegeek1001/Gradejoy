class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authorized_user, except: [:index, :new, :create]
  before_filter :authenticate_user!
  respond_to :html, :js, :json, :xml

  def index
    @courses = current_user.courses
      respond_with(@courses)
  end

  def show
    @assignments = current_user.assignments
    @students = current_user.students
    respond_with(@course)
  end

  def new
    @course = current_user.courses.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = current_user.courses.new(course_params)
    @courses = current_user.courses
    if @course.save
       respond_with @courses
    else
      render :new
    end
  end

  def update
    @course.update(course_params)
    respond_with(@course)
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def set_student
      @student = Student.find(params[:student_id])
    end

    def set_assignment
      @assignment = Assignment.find(params[:assignment_id])
    end

    def course_params
      params.require(:course).permit(:name, :time, :period, :user, :section)
    end

    def authorized_user
      @course = current_user.courses.find_by(id: params[:id])
      redirect_to courses_path, notice: "Not authorized to view that course" if @course.nil?
    end
end
