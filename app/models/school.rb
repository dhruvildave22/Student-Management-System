class School < ApplicationRecord
  has_many :students
  has_many :teachers#, :as => :teacherable
  validates :s_name, :s_address, :phone_no, presence: true
  validates :phone_no, length: { is: 10 }, numericality: { only_integer: true }
  validates :s_name, length: { in: 3..40 }
  validates :s_address, length: { in: 3..40 }

  include Teacherable
  # include Studentable

  def find_teachers
    find_all_teachers(self)
  end

  # def find_student
  #   find_all_students(self)
  # end
end