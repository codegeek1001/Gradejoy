class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :authorized_user, except: [:index, :new, :create]
  respond_to :html, :js

  def index
    @courses = current_user.courses
      respond_with(@courses)
  end

  def show
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

    if @course.save
       redirect_to @course
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

    def course_params
      params.require(:course).permit(:name, :time, :period, :user, :section)
    end

    def authorized_user
      @course = current_user.courses.find_by(id: params[:id])
      redirect_to courses_path, notice: "Not authorized to view that course" if @course.nil?
    end
end
