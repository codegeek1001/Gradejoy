class CourseEnrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student
  belongs_to :user
  validates :student_id, :course_id, presence: true
end
