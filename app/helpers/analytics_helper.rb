module AnalyticsHelper

  def title
    base_title = "showing all students"
    if @title.nil?
       base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def gravatar(email, size, border)
    "<img src=\"https://www.gravatar.com/avatar/#{
    Digest::MD5.new.update(
      email.to_s.strip.downcase
    ).hexdigest
    }?f=y=#{size}&r=g\" style=\"height:#{size}px;width:#{size}px;border:#{border}px\">".html_safe
  end

  def my_form_tag(get_students_by_course, &block)
    attrs  = "method='get' action='#{get_students_by_course}'"
    fields = capture(&block)
    "<form #{attrs}>  #{fields} </form>".html_safe
  end

  def my_label_tag(course_type)
    "<label>#{course_type}</label>".html_safe
  end

  def my_text_field_tag(name)
    "<input name='#{:course_type}'  type='text' />".html_safe
  end

  def my_submit_tag(txt="Submit")
    "<input type='submit' value='#{txt}'>".html_safe
  end
end

# 