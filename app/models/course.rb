class Course < ApplicationRecord
  has_many :students
  belongs_to :school

  validates :course_type, inclusion: { in: %w(RBSE CBSE others) }, presence: true
end
