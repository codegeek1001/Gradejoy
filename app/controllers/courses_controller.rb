class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authorized_user, except: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    @courses = current_user.courses
  end

  def show
  end

  def new
    @course = current_user.courses.new
  end

  def edit
  end

  def create
    @course = current_user.courses.new(course_params)
    @courses = current_user.courses
    if @course.save
      respond_with(@courses)
    else
      render :new
    end
  end

  def update
    @course.update(course_params)
  end

  def destroy
    @course.destroy
    redirect_to(courses_path)
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :time, :period, :user, :section)
    end

    def authorized_user
      @course = current_user.courses.find_by(id: params[:id])
      redirect_to courses_path, notice: "Not authorized to view that course" if @course.nil?
    end
end
