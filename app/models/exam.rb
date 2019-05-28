class Exam < ApplicationRecord
  belongs_to :subject
  has_many :exam_students
  has_many :students ,through: :exam_students
  validates :subject_id, :student_id, :exam_name, :exam_duration, presence: true
  validates :exam_duration, numericality: true
  validates :exam_name, inclusion: { in: %w(midterm main)}
end