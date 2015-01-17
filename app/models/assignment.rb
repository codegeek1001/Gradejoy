class Assignment < ActiveRecord::Base
  validates :title, presence: true
  has_many :course_assignments
  has_many :courses, through: :course_assignments
  belongs_to :user

  has_many :grades
  has_many :students, through: :grades
end
