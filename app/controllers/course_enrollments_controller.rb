class CourseEnrollmentsController < ApplicationController
  before_action :set_course_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorized_user, except: [:index, :new, :create]

  respond_to :html, :js, :xml, :json

  def index
    @course_enrollments = current_user.course_enrollments
    respond_with(@course_enrollments)
  end

  def new
    @course_enrollment = current_user.course_enrollments.new
    respond_with(@course_enrollment)
  end

  def edit
  end

  def show
  end

  def create
    @course_enrollment = current_user.course_enrollments.new(course_enrollment_params)
    if @course_enrollment.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def update
    @course_enrollment.update(course_enrollment_params)
    respond_with(@course_enrollment)
  end

  def destroy
    @course_enrollment.destroy
    respond_with(@course_enrollment)
  end

  def mark_inactive
    @course_enrollment.update_attribute(:active, false)
    redirect_to(:back)
  end

  private
    def set_course_enrollment
      @course_enrollment = CourseEnrollment.find(params[:id])
    end

    def course_enrollment_params
      params.require(:course_enrollment).permit(:student_id, :course_id, :user_id, :active)
    end

    def authorized_user
      @course_enrollment = current_user.course_enrollments.find_by(id: params[:id])
      @course = current_user.courses.find_by(id: params[:id])
      redirect_to courses_path, notice: "Not authorized to view or edit that course enrollment" if @course_enrollment.nil?
    end

end
