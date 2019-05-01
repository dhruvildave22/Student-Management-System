class Subject < ApplicationRecord
  has_many :students
  has_one :exam
  belongs_to :teacher

  validates : :subject_name, length: { in: 3..15}, presence: true

end