class AddActiveToCourseEnrollment < ActiveRecord::Migration
  def change
    add_column :course_enrollments, :active, :boolean, default: true
    add_index :course_enrollments, :active
  end
end
