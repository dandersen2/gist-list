module ApplicationHelper
  def std_format_date date
    return "" unless date
    date.strftime("%-d-%b-%Y at %l:%M %p")
  end
end
