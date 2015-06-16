class Grade < ActiveRecord::Base

  validates :points_earned, presence: true
  belongs_to :student, dependent: :destroy
  belongs_to :assignment, dependent: :destroy
  belongs_to :user

  def self.for_student(student)
    where(student: student)
  end
end
