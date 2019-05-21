class Klass < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  has_many :subjects
end
