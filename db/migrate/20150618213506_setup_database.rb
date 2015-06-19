class SetupDatabase < ActiveRecord::Migration
  def change
    #assignments table
    create_table :assignments do |t|
      t.string :name, null: false
      t.string :date_due
      t.string :category
      t.decimal :points_earned
      t.decimal :total_points
      t.integer :user_id, null: false, index: true
      t.timestamps
    end

    #categories table
    create_table :categories do |t|
      t.string :category, null: false
      t.decimal :weight, null: false
      t.integer :user_id, null: false, index: true
      t.timestamps
    end

    #courses table
    create_table :courses do |t|
      t.string :name, null: false
      t.time :time
      t.string :period
      t.string :section
      t.integer :user_id, null: false, index: true
      t.timestamps
    end

    #course_assignments
    create_table :course_assignments do |t|
      t.references :course, null: false, index: true
      t.references :assignment, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps
    end

    #course_enrollments table
    create_table :course_enrollments do |t|
      t.references :course, null: false, index: true
      t.references :student, null: false, index: true
      t.boolean :active, default: true
      t.integer :user_id, null: false, index: true
      t.timestamps
    end

    #grades
    create_table :grades do |t|
      t.references :student, null: false, index: true
      t.references :assignment, null: false, index: true
      t.decimal :points_earned, null: false, index:true
      t.integer :user_id, null: false, index: true
      t.timestamps
    end

    #students table
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birth_date
      t.string :grade_level
      t.integer :user_id, null: false, index: true
      t.timestamps
    end

    #users table
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true



    #foreign keys

    add_foreign_key :assignments, :users, dependent: :delete
    add_foreign_key :categories, :users, dependent: :delete
    add_foreign_key :courses, :users, dependent: :delete
    add_foreign_key :course_assignments, :users, dependent: :delete
    add_foreign_key :course_enrollments, :users, dependent: :delete
    add_foreign_key :grades, :users, dependent: :delete
    add_foreign_key :students, :users, dependent: :delete
    add_foreign_key :course_assignments, :assignments, dependent: :delete
    add_foreign_key :course_assignments, :courses, dependent: :delete
    add_foreign_key :course_enrollments, :courses, dependent: :delete
    add_foreign_key :course_enrollments, :students, dependent: :delete
    add_foreign_key :grades, :assignments, dependent: :delete
    add_foreign_key :grades, :students, dependent: :delete
  end
end
