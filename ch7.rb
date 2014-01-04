#Chapter 7 Section 5

#99 Bottles of Beer on the Wall
beer = 4
while (beer >= 2)
	puts beer.to_s + " bottles of beer on the wall, " + beer.to_s + " bottles of beer, yadda yadda"
	beer = beer -1
	puts beer.to_s + " bottles of beer on the wall"
end

puts "okay, enough of that, talk to grandma!"

#Deaf Grandma
byeCounter = 0
while true
	shout = gets.chomp
	if shout == "BYE"
		if byeCounter >=2 #since we start at zero, we will hit 3 after 2 iterations
			puts "FINE, BYE!!!"
			break
		else 
			puts "DON'T LEAVE ME!!!!!"
			byeCounter +=1
		end
	elsif shout == shout.upcase
		puts "NO, NOT SINCE "+ (1938 + rand(13)).to_s
		byeCounter = 0
	else
		puts "HUH?! SPEAK UP SONNY!"
		byeCounter = 0
	end
end

#Leap years
puts "I'll find leap years for you, enter a starting year"
startYear = gets.chomp.to_i
puts "and an ending year"
endYear = gets.chomp.to_i

puts "The following are Leap Years: "

#Check Initial Year
if (startYear%100) == 0 && (startYear%400) == 0
	puts startYear
elsif (startYear%4) == 0 && startYear%100 != 0
	puts startYear	
end

#Iterate the loop this many times
yearsRemaining = (endYear.to_i - startYear.to_i)

while yearsRemaining >1

	#Check subsequent years in between
	startYear +=1
	if (startYear%100) == 0 && (startYear%400) == 0
		puts startYear
	elsif (startYear%4) == 0 && startYear%100 != 0
		puts startYear	
	end
	yearsRemaining = (endYear.to_i - startYear.to_i) #Update counter
end

#Check end year
if (endYear%100) == 0 && (endYear%400) == 0
	puts endYear
elsif (endYear%4) == 0 && endYear%100 != 0
	puts endYear	
end
