class Course < ApplicationRecord
  has_many :students
  has_many :student_courses
  has_many :students, through: :student_courses
  belongs_to :school
  validates :course_type, inclusion: { in: %w(RBSE CBSE others) }, presence: true
end
