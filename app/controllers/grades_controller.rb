class GradesController < ApplicationController
  before_action :set_course, only: [:new, :create, :update, :destroy]
  before_action :set_student, only: [:new, :create, :update, :destroy]
  before_action :set_assignment, only: [:new, :create, :update, :destroy]

  def new
    @url = url_for(:controller => 'grades', :action => 'create')
    @grade = current_user.grades.new
  end

  def create
    @grade = current_user.grades.new(:points_earned => grade_params[:points_earned], :student_id => @student.id, :assignment_id => @assignment.id)

    if @grade.save
      respond_with @course
    else
      render :new
    end
  end

  def edit
    @grade = Grade.get_grade(params[:student_id],params[:assignment_id])
    @url = url_for(:controller => 'grades', :action => 'update')
  end

  def update
    @grade = Grade.get_grade(params[:student_id],params[:assignment_id])
    @grade.update(grade_params)
    respond_with(@course)
  end

  def destroy
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

  def grade_params
    params.require(:grade).permit(:points_earned)
  end

  def authorized_user
    @grade = current_user.grades.find_by(id: params[:id])
    redirect_to courses_path, notice: "Not authorized to edit or view that grade" if @grade.nil?
  end


end
