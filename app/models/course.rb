class Course < ApplicationRecord
  belongs_to :school
  has_many :students
  has_many :student_courses
  has_many :students, through: :student_courses
  validates :course_type, inclusion: { in: %w(RBSE CBSE others) }, presence: true
end
