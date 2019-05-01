class Exam < ApplcationRecord
  has_many :students
  belongs_to :subject

  validates :exam_name, :exam_duration, presence: true
  validates :exam_duration, numericality: true
end