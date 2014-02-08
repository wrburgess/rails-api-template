module ApplicationHelper
  def copyright_notice
    "&copy; ".html_safe + Time.new.strftime("%Y") + " JBRB. All Rights Reserved"
  end
end
