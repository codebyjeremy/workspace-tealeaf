# Jeremy Vatter
# Blackjack game Game
# 8 January 2014

# A simple black jack game

# automated dealer
def automate_dealer (hand, deck)
	dealer_total = calc_total hand # calculates dealer total
	
	if dealer_total >= 21
		display_hand hand, "dealer" #displays hand
		puts "Total is: " + player_total.to_s + "\n " #displays total
		return dealer_total # returns immediately
	end

	if dealer_total < 17
		hand << (deal_card deck)
		hit hand, deck, "dealer"
	else
		dealer_total
	end
end

# let's play blackjack
def blackjack
	name = prompt_user
	decks = init_decks 5 # create decks
	nil until (play decks) == false # play blackjack until we are done
	puts "Well that was fun.  Later, " + name # takes all of the money :(
	exit
end

# calculates total
def calc_total (hand)
	total = 0
	hand.each do |card|
		total += find_value card.keys.first
	end
	total = (total > 21) && (check_aces hand, total) ? total -= 10: total
end

# check for aces
def check_aces (hand, player_total)
	hand.each do |card|
		if card.has_key?('A') == true
			player_total -= 10
			return true
		end
	end
	false
end

# chooses which deck to play
def choose_deck (decks)
	decks.sample
end

# get card
def deal_card (deck) # note: deck is a hash

	suit = deck.invert.values.sample	# pick a random suit
	number = (deck.fetch(suit)).shuffle!.pop # pick a card from suit

	if suit == :spades
		{number => " of Spades"}
	elsif suit == :clubs
		{number => " of Clubs"}
	elsif suit == :hearts
		{number => " of Hearts"}
	else
		{number => " of Diamonds"}
	end
end

# displays hand
def display_hand (hand, player)
	total = 0
	say = ""
	if player == "player"
		say = "You have: "
	else
		say = "I have: "
	end
	puts say
	hand.each do |card|
		puts card.keys.first.to_s + card.fetch(card.keys.first) # display card
	end
	puts
end

# gets face card value
def find_value (card)
	if card == 'A'
		11
	elsif card == 'K' || card == 'Q' || card == 'J'
		10
	else
		card
	end
end

# hit returns total
def hit (hand, deck, player)
	display_hand hand, player #display hand
	player_total = calc_total hand
	puts "Total is: " + player_total.to_s + "\n " #display total

	return player_total if player_total >= 21 # returns if we win or bust

	if player == "dealer"
		return automate_dealer hand, deck # automates dealer
	end

	puts "Do you want to hit, or stay?"
	puts "Please enter 'hit' or 'stay'."
	decision = gets.downcase.chomp

	until decision == 'hit' || decision  == 'stay'
		puts "I said please enter 'hit' or 'stay'."
		puts "Do you want to hit, or stay?"
		puts "Please enter 'hit' or 'stay'."
		decision = gets.downcase.chomp
	end

	if decision == 'hit'
		system "clear" # easier to read game
		hand << (deal_card deck)
		hit hand, deck, player
	else
		puts
		player_total
	end
end

# initialize a single deck
def init_deck
	deck = { 
		spades: [2,3,4,5,6,7,8,9,10,'J','Q','K','A'], 
		clubs: [2,3,4,5,6,7,8,9,10,'J','Q','K','A'], 
		hearts: [2,3,4,5,6,7,8,9,10,'J','Q','K','A'],
		diamonds: [2,3,4,5,6,7,8,9,10,'J','Q','K','A']
	}
end

# initializes all decks
def init_decks (num_decks)
	([] << init_deck)*num_decks	# returns an array of requested decks
end

# play hand
def play (decks)
	deck  = choose_deck decks

	player_hand = []
	dealer_hand = []

	player_hand << (deal_card deck)
	player_hand << (deal_card deck)

	player_total = hit player_hand, deck, "player"

	# evaluate scenarios
	if player_total > 21 # if player busted
		puts "You busted. Game Over. You lost. You're broke. Get out."
	elsif player_total == 21 # if player hit 21
		puts "You win. Congrats.  I, uh, lost your bet, however. Sorry."
	else # if player stayed below 21
		dealer_hand << (deal_card deck)
		dealer_hand << (deal_card deck)
		dealer_total = hit dealer_hand, deck, "dealer"

		if dealer_total > 21
			puts "You win. Congrats. I, uh, lost your bet however. Sorry"
		elsif dealer_total == 21 || dealer_total >= player_total #dealer wins
			puts "I win. Hahahaha. Game Over. You lost. You're broke. Get out."
		else
			puts "You win. Congrats. I, uh, lost your bet, however. Sorry."
		end
	end

	# asks if player wants to keep playing
	puts "\nDo you want to play again"
	puts "Please enter 'yes' or 'no'."
	decision = gets.downcase.chomp

	until decision == 'yes' || decision  == 'no'
		puts "I said please enter 'yes' or 'no'."
		puts "Do you want to play again"
		puts "Please enter 'yes' or 'no'."
		decision = gets.downcase.chomp
	end

	system "clear" # clears screen
	return true if decision == 'yes'
	false # by default, return no
end

# prompt the user and return name
def prompt_user
	system "clear"
	puts "Hello, let's play Blackjack.  First, tell me your name: "
	name = gets.chomp
	puts "Welcome, " + name + ", get ready to lose all of your money."
	puts
	name
end

blackjack