class Course < ApplicationRecord
  has_many: students

  validates :course_name, :course_type, presence: true
  validates :course_type, inclusion: { in: %w(RBSE CBSE others), 
end
