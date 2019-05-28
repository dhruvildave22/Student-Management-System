class Student < ApplicationRecord
  belongs_to :course
  has_many :subject_type
  has_many :teachers, :through=>:subject_type
  has_many :subjects, through: :subjectenrollment
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :exam_students
  has_many :exams ,through: :exam_students

  validates :exam_id, :school_id, :teacher_id, :std_name, :std_father_name, :std_gender, :std_date_of_birth, :std_address, :std_date_of_join, presence: true
  validates :std_name, :std_father_name, length: { in: 3..15}
  validates :std_gender, inclusion: { in: %w(male female others),
    message: "%{value} is not a valid gender" }
  validates :std_address, length: { in: 3..40 }
end