require 'colorize'

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
  year, month, day = date.split('-')
  year.to_i
  month = month.to_i
  day = day.to_i

  return true if valid_date_format?(date) && valid_day?(day) && valid_month?(month)

  false
end

def set_valid_date
  date = gets.chomp
  until valid_date?(date)
    print "\n🛑 ❌ Invalid date format, please enter a valid date (yyyy-mm-dd): ".red
    date = gets.chomp
  end
  date
end
