  class Student < ApplicationRecord
  has_many :subjects
  has_many :exams
  # belongs_to :studentable, polymorphic: true

  validates :school_id, :std_name, :std_father_name, :std_gender, :std_date_of_birth, :std_address, :std_date_of_join, presence: true
  validates :std_name, :std_father_name, length: { in: 3..15}
  validates :std_gender, inclusion: { in: %w(male female others),
    message: "%{value} is not a valid gender" }
  validates :std_date_of_birth, :std_date_of_join, numericality: { only_integer: true }
  validates :std_address, length: { in: 3..40 }
  validate :joining_date
  before_create :populate_available_exams

  def joining_date
    if self.date_of_join >= Date.today 
      errors.add(:base, "Joining can not be created before the fixed date has started")
    end
  end

  def populate_available_exams
    self.std_name = self.exam.exam_name
  end
end