class Exam < ApplicationRecord
  has_many :students
  belongs_to :subject

  validates :subject_id, :exam_name, :exam_duration, presence: true
  validates :exam_duration, numericality: true
end