class TeacherSerializer < ApplicationSerializer
  attributes :id, :t_name, :date_of_join
  has_many :subjects


end