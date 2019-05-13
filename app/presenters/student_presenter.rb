class StudentPresenter < ApplicationPresenter
  def full_name
    "#{@model.s_name}"
  end
end