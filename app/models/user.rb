class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,  :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

 def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid.to_s).first_or_create do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
   end
 end

  has_many :courses
  has_many :assignments
  has_many :students
  has_many :course_assignments
  has_many :course_enrollments
  has_many :grades
  has_many :categories

end
