class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,  :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses
  has_many :assignments
  has_many :students
  has_many :course_assignments
  has_many :course_enrollments
  has_many :grades
  has_many :categories

end
