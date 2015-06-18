class AddTimestampToCourseAssignment < ActiveRecord::Migration
  def change
    add_column(:course_assignments, :created_at, :datetime)
    add_column(:course_assignments, :updated_at, :datetime)
  end
end
