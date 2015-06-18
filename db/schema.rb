# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150617160720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.date     "date_due"
    t.string   "category"
    t.decimal  "points_earned"
    t.decimal  "total_points"
    t.integer  "course_id"
    t.integer  "user_id"
  end

  add_index "assignments", ["category"], name: "index_assignments_on_category", using: :btree
  add_index "assignments", ["course_id"], name: "index_assignments_on_course_id", using: :btree
  add_index "assignments", ["date_due"], name: "index_assignments_on_date_due", using: :btree
  add_index "assignments", ["points_earned"], name: "index_assignments_on_points_earned", using: :btree
  add_index "assignments", ["title"], name: "index_assignments_on_title", using: :btree
  add_index "assignments", ["total_points"], name: "index_assignments_on_total_points", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.decimal  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "categories", ["category"], name: "index_categories_on_category", using: :btree
  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree
  add_index "categories", ["weight"], name: "index_categories_on_weight", using: :btree

  create_table "course_assignments", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_assignments", ["assignment_id"], name: "index_course_assignments_on_assignment_id", using: :btree
  add_index "course_assignments", ["course_id"], name: "index_course_assignments_on_course_id", using: :btree
  add_index "course_assignments", ["user_id"], name: "index_course_assignments_on_user_id", using: :btree

  create_table "course_enrollments", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "active",     default: true
  end

  add_index "course_enrollments", ["active"], name: "index_course_enrollments_on_active", using: :btree
  add_index "course_enrollments", ["course_id"], name: "index_course_enrollments_on_course_id", using: :btree
  add_index "course_enrollments", ["student_id"], name: "index_course_enrollments_on_student_id", using: :btree
  add_index "course_enrollments", ["user_id"], name: "index_course_enrollments_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "period"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "section"
    t.time     "time"
  end

  add_index "courses", ["name"], name: "index_courses_on_name", using: :btree
  add_index "courses", ["period"], name: "index_courses_on_period", using: :btree
  add_index "courses", ["section"], name: "index_courses_on_section", using: :btree
  add_index "courses", ["time"], name: "index_courses_on_time", using: :btree
  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "grades", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "assignment_id"
    t.decimal  "points_earned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "grades", ["assignment_id"], name: "index_grades_on_assignment_id", using: :btree
  add_index "grades", ["points_earned"], name: "index_grades_on_points_earned", using: :btree
  add_index "grades", ["student_id"], name: "index_grades_on_student_id", using: :btree
  add_index "grades", ["user_id"], name: "index_grades_on_user_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.date     "birthdate"
    t.string   "grade_level"
  end

  add_index "students", ["birthdate"], name: "index_students_on_birthdate", using: :btree
  add_index "students", ["first_name"], name: "index_students_on_first_name", using: :btree
  add_index "students", ["grade_level"], name: "index_students_on_grade_level", using: :btree
  add_index "students", ["last_name"], name: "index_students_on_last_name", using: :btree
  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
