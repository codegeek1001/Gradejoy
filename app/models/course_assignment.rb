class CourseAssignment < ActiveRecord::Base
  belongs_to :course, dependent: :destroy
  belongs_to :assignment, dependent: :destroy
  belongs_to :user
  validates :course_id, :assignment_id, presence: true
end
