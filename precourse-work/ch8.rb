#chapter 8 section 3

#building and sorting an array
puts "tell me words and I will sort them!  Push ENTER when done"
words = []
while true
	word = gets.chomp
	if word == ""
		break
	end
	words.push word
end

if words.length == 0
	puts "there are no words"
else
	puts "your array, sorted by me: "
	puts words.sort
end

#table of contents
puts "below is the TOC"

chapters = [["Getting Started", 1],["Numbers", 9], ["Letters", 13]]
chapterNum = 1
chapters.each do |chapter|
	name = chapter[0]
	page = chapter[1]
	puts ("Chapter "+ chapterNum.to_s + " : "+name).ljust(27) + ("page "+page.to_s).rjust(10)
	chapterNum+=1
end