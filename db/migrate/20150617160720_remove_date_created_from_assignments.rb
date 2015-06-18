class RemoveDateCreatedFromAssignments < ActiveRecord::Migration
  def change
    remove_index :assignments, :date_created
    remove_column :assignments, :date_created, :date
  end
end
