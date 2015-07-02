class Course < ActiveRecord::Base
  validates :name, presence: true

  has_many :course_enrollments, dependent: :destroy
  has_many :students, through: :course_enrollments

  has_many :course_assignments, dependent: :destroy
  has_many :assignments, through: :course_assignments

  belongs_to :user
end
