class SchoolPresenter < ApplicationPresenter
  presents :school
  delegate :s_name, to: :school

  def linked_name
    site_link(school.full_name.present? ? school.full_name : school.s_name)
  end

  private
  def site_link(content)
    h.link_to_if(school.url.present?, content, school.url)
  end
end