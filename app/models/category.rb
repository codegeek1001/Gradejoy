class Category < ActiveRecord::Base
  validates :category, presence: true
  validates :weight, presence: true
  #belongs_to :assignment
  belongs_to :user, dependent: :destroy
end
