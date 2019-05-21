class Teacher < ApplicationRecord
  # has_and_belongs_to_many :subjects
  has_many :subject_teachers
  has_many :subjects, through: :subject_teachers
  has_many :klasses
  has_many :students, through: :klasses
  belongs_to :teacherable, polymorphic: true
  
  validates :school_id, :t_name, :father_name, :gender, :date_of_birth, :t_address, :date_of_join, presence: true
  validates :t_name, :father_name, length: { in: 3..15}
  validates :gender, inclusion: { in: %w(male female others),
    message: "%{value} is not a valid gender" }
  validates :date_of_birth, :date_of_join, numericality: { only_integer: true }
  validates :t_address, length: { in: 3..40 }

end