#chapter 9 section 5

#ask method
def ask question
	while true
		puts question
		reply = gets.chomp.downcase
		if (reply =="yes" || reply == "no")
			if reply == "yes"
				return true
			else
				return false
			end
			break
		else
			puts "Please answer 'yes' or 'no'."
		end
	end
end

ask "do you like programming"
ask "do you want to win the lottery?"
ask "are you hungry?"



#roman numerals
def romanNumerals num
	#Find remainder, divide out next factor
	returnString = 'M'*(num/1000)
	returnString+= 'D'*(num%1000 /500)
	returnString+= 'C'*(num%500/100)
	returnString+= 'L'*(num%100/50)
	returnString+= 'X'*(num%50/10)
	returnString+= 'V'*(num%10/5)
	returnString+= 'I'*(num%5/1)
	return returnString
end

puts (romanNumerals 1234)

#modern roman numerals
def modernRomanNumerals num
	returnString=""

	#Thousands Spot
	returnString+='M'*(num/1000)

	#Hundreds Spot
	hundreds=(num%1000/100)
	if hundreds== 4
		returnString+="CD"
	elsif hundreds ==9
		returnString+="CM"
	else
		returnString+='D'*(num%1000 /500)
		returnString+='C'*hundreds
	end

	#Tens Spot
	tens=(num%100/10)
	if tens==4
		returnString+="XL"
	elsif tens==9
		returnString+="XC"
	else
		returnString+='L'*(num%100/50)
		returnString+='X'*tens
	end

	#Ones Spot
	ones= (num%10/1)
	if ones==4
		returnString+= "IV"
	elsif ones ==9
		returnString+= "IX"
	else
		returnString+='V'*(num%10/5)
		returnString+='I'*ones
	end

	return returnString
end
puts (modernRomanNumerals 490)