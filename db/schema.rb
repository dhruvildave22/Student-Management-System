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

ActiveRecord::Schema.define(version: 2019_05_22_055906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "course_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "exam_students", force: :cascade do |t|
    t.integer "exam_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "exam_name"
    t.integer "exam_duration"
    t.bigint "subject_id"
    t.bigint "student_id"
    t.index ["student_id"], name: "index_exams_on_student_id"
    t.index ["subject_id"], name: "index_exams_on_subject_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "subject"
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_klasses_on_student_id"
    t.index ["teacher_id"], name: "index_klasses_on_teacher_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "s_name"
    t.string "s_address"
    t.bigint "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_courses", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "std_name"
    t.string "std_father_name"
    t.string "std_gender"
    t.string "std_address"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "std_date_of_birth"
    t.date "std_date_of_join"
    t.bigint "course_id"
    t.bigint "exam_id"
    t.bigint "subject_id"
    t.bigint "teacher_id"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["school_id"], name: "index_students_on_school_id"
    t.index ["subject_id"], name: "index_students_on_subject_id"
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "students_exams", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "exam_id"
    t.index ["exam_id"], name: "index_students_exams_on_exam_id"
    t.index ["student_id"], name: "index_students_exams_on_student_id"
  end

  create_table "subject_enrollment", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subject_teachers", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subject_types", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.index ["student_id"], name: "index_subject_types_on_student_id"
    t.index ["teacher_id"], name: "index_subject_types_on_teacher_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.index ["student_id"], name: "index_subjects_on_student_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "teacher_subjects", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "t_name"
    t.string "father_name"
    t.string "gender"
    t.integer "date_of_birth"
    t.string "t_address"
    t.integer "date_of_join"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacherable_id"
    t.string "teacherable_type"
    t.index ["school_id"], name: "index_teachers_on_school_id"
    t.index ["teacherable_type", "teacherable_id"], name: "index_teachers_on_teacherable_type_and_teacherable_id"
  end

  add_foreign_key "courses", "schools"
  add_foreign_key "exams", "students"
  add_foreign_key "exams", "subjects"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "schools"
  add_foreign_key "students", "subjects"
  add_foreign_key "students", "teachers"
  add_foreign_key "students_exams", "exams"
  add_foreign_key "students_exams", "students"
  add_foreign_key "subject_types", "students"
  add_foreign_key "subject_types", "teachers"
  add_foreign_key "subjects", "students"
  add_foreign_key "subjects", "teachers"
  add_foreign_key "teachers", "schools"
end
