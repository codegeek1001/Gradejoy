class Grade < ActiveRecord::Base

  validates :points_earned, presence: true
  belongs_to :student
  belongs_to :assignment
  belongs_to :user

  def self.for_student(student)
    where(student: student)
  end

  def self.get_grade(student_id, assignment_id)
    records = Grade.where("student_id"=>student_id,"assignment_id"=>assignment_id).first
  end
end
