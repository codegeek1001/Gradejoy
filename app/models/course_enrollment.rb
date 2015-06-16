class CourseEnrollment < ActiveRecord::Base
  belongs_to :course, dependent: :destroy
  belongs_to :student, dependent: :destroy
  belongs_to :user
  validates :student_id, :course_id, presence: true
end
