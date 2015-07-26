module Backend::StaffsHelper
  def staff_link_for(staff)
    unless staff.link == ''
      staff_link = ' - '
      staff_link += staff.link
      link_to(staff_link, staff.link, target: '_blank')
    end
  end
end
