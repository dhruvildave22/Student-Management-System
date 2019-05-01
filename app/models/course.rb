class Course < ApplicationRecord
  has_many: students

  validates :course_type, inclusion: { in: %w(RBSE CBSE others), presence: true
end
