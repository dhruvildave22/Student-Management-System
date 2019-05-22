class SubjectEnrollment < ApplicationRecord
  belongs_to :students
  belongs_to :subjects
end