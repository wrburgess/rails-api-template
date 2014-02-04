module ApplicationHelper

  def copyright_notice
    copyright = '&copy; '.html_safe + Time.new.strftime('%Y') + ' JBRB. All Rights Reserved'
  end

end