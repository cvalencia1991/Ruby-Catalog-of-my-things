def valid_date_format?(date)
  date =~ /^\d{4}-\d{2}-\d{2}$/
end

def valid_day?(day)
  day >= 1 && day <= 31
end

def valid_month?(month)
  month >= 1 && month <= 12
end

def valid_date?(date)
  year, month, day = date.split("-")
  year, month, day = year.to_i, month.to_i, day.to_i

  if valid_date_format?(date) && valid_day?(day) && valid_month?(month)
    return true
  else
    return false
  end
end

def get_valid_date
  print 'Enter the publication date e.g (2023-01-11): '
  date = gets.chomp
  until valid_date?(date)
    print "Invalid date format, please enter a valid date (yyyy-mm-dd): "
    date = gets.chomp
  end
  return date
end