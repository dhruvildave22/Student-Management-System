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
end

# 