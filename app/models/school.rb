class School < ApplicationRecord
  has_many :teachers, dependent: :destroy
  has_many :students, dependent: :destroy
 
  validates :s_name, :s_address, :phone_no, presence: true
  validates :phone_no, length: { is: 10 }, numericality: { only_integer: true }
  validates :s_name, length: { in: 3..40 }
  validates :s_address, length: { in: 3..40 }

end