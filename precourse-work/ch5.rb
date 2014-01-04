#Chapter 5 section 6

#full name greeting
puts "What\'s your first name?"
fname= gets.chomp
puts "What about your middle?"
mname= gets.chomp
puts "And your last??"
lname= gets.chomp

puts "Good day to you, " + fname + " " + mname+ " " +lname + "!"

#bigger, better favorite number
puts "What is your favorite number?"
num = gets.chomp
#evaluate num.to_i first, then add 1
num = (num.to_i) +1 
puts "But " + num.to_s + " is a better number."