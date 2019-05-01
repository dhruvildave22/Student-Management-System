class Teacher < ApplicationRecord
  has_many :subjects
  belongs_to :school
  
  validates :t_name, :father_name, :gender, :date_of_birth, :t_address, :date_of_join, presence: true
  validates :t_name, :father_name, length: { in: 3..15}
  validates :gender, inclusion: { in: %w(male female others),
    message: "%{value} is not a valid gender" }
  validates :date_of_birth, :date_of_join numericality: { only_integer: true }
  validates :t_address, length: { in: 3..40 }

end