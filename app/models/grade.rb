class Grade < ActiveRecord::Base

  validates :points_earned, presence: true
  belongs_to :student
  belongs_to :assignment
  belongs_to :user

  def self.for_student(student)
    where(student: student)
  end
end
