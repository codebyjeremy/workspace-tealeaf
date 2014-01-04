#Chapter 6 section 2

#angry boss
puts "Yeah what is it?"
stuffToShout = gets.chomp.upcase
puts "WHADDAYA MEAN \"" + stuffToShout + "\"?!?! YOU'RE FIRED!!"

#table of contents
line_width = 25
puts ("Table of Contents".center(line_width))
puts ("Chapter 1: Getting Started".ljust(line_width)) + ("page 1".rjust(line_width))
puts ("Chapter 2: Numbers".ljust(line_width)) + ("page 9".rjust(line_width+1))
puts ("Chapter 3: Letters".ljust(line_width)) + ("page 13".rjust(line_width+2))
