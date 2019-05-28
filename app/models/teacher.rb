class Teacher < ApplicationRecord
  belongs_to :teacherable, polymorphic: true
  has_many :students
  has_many :subject_teachers
  has_many :subjects, through: :subject_teachers
  validates :school_id, :t_name, :father_name, :gender, :date_of_birth, :t_address, :date_of_join, presence: true
  validates :t_name, :father_name, length: { in: 3..15}
  validates :gender, inclusion: { in: %w(male female others),
    message: "%{value} is not a valid gender" }
  validates :date_of_birth, :date_of_join, presence: true
  validates :t_address, length: { in: 3..40 }
end