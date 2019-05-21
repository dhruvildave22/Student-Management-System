class Student < ApplicationRecord
  has_many :subjects
  # has_and_belongs_to_many :exams
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :exam_students
  has_many :exams ,through: :exam_students
  belongs_to :course
  has_many :subjects
  has_many :teachers, through: :subjects

  validates :exam_id, :school_id, :std_name, :std_father_name, :std_gender, :std_date_of_birth, :std_address, :std_date_of_join, presence: true
  validates :std_name, :std_father_name, length: { in: 3..15}
  validates :std_gender, inclusion: { in: %w(male female others),
    message: "%{value} is not a valid gender" }
  validates :std_address, length: { in: 3..40 }
end