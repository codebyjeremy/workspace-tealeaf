puts "When was your birth year (ex 2014)?"
year = gets.chomp
puts "And your birth month (ex 01)?"
month = gets.chomp
puts "And your birth day? (ex 01)"
day = gets.chomp

birthday = Time.local(year, month, day)
today = Time.now

DAY = 0.0328767123288 # numbers of months in each day

# adjust the year to take in consideration the months / days of the year
adj_year = (((birthday.month - today.month) / DAY) + 
  (birthday.day - today.day)) / 365

years_old = today.year - birthday.year - adj_year # calc age

puts "You are #{years_old.to_i} years old!!! LOL!!!" # spanking is bad
