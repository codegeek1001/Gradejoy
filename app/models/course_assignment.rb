class CourseAssignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :assignment
  belongs_to :user
  validates :course_id, :assignment_id, presence: true
end
