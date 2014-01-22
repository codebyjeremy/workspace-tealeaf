# Jeremy Vatter
# Blackjack Game
# 16 January 2014

# A modified OOP version of the black jack game

class Card

  # default constructor
  def initialize (value, suit)
    @value = value
    @suit = "of #{suit}"
  end

  # displays card
  def display_card
    "#{@value} #{@suit}"
  end

  # returns value in numeric form
  def get_value
    if @value == 'A'
      11
    elsif @value == 'J' || @value == 'Q' || @value == 'K'
      10
    else
      @value
    end
  end

  # determines if card is an ace
  def is_ace?
    @value == 'A'
  end
end

class Deck

  # default constructor
  def initialize
    @deck = []
    add_to_deck("Spades")
    add_to_deck("Hearts")
    add_to_deck("Clubs")
    add_to_deck("Diamonds")
    shuffle
    shuffle
    return @deck
  end

  # adds an entire suit to the deck
  def add_to_deck (suit)
    cards = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']
    cards.each {|val| @deck << Card.new(val, suit)}
  end

  # shuffles the deck
  def shuffle
    @deck.shuffle!
  end

  # deals a card from the deck
  def deal_card
    @deck.pop
  end
end

class Player
  attr_reader :score

  # creates a default player unless otherwise specified
  def initialize (hand = [], score = 0)
    @hand = hand
    @score = score
  end

  # adds a card to hand
  def hit (deck)
    @hand << deck.deal_card
    calc_score
    true
  end

  # calculates score
  def calc_score
    @score = 0
    @hand.each do |card| 
      @score += card.get_value
    end

    if @score > 21 #adjusts score for aces
      aces = num_aces @hand
      @score -= 10 if aces == 1
      @score -= 10 * (aces - 1) if aces >=2
    end  
  end
  # prints hand
  def display_hand
    @hand.each {|card| puts card.display_card}
  end

  # plays the players hand
  def play_hand (deck)
    puts "You have: "
    display_hand
    puts "\nYour score is: #{score}"
    return @score if @score >= 21 # end turn if we win or bust

    puts "\nDo you want to hit or stay?"
    puts "Please type 'hit' or 'stay"

    decision = gets.chomp.downcase
    until decision == "hit" || decision == "stay"
      puts "\nI said please enter 'hit' or 'stay'."
      puts "Do you want to hit, or stay?"
      puts "Please enter 'hit' or 'stay'."
      decision = gets.downcase.chomp
    end

    (system "clear") && (hit deck) && (play_hand deck) if decision == "hit"
    score
  end

  # reset hand so we can play more turns
  def reset_hand
    @hand = []
  end

  def num_aces (hand)
    aces = 0
    hand.each {|card| aces += 1 if card.is_ace?}
    aces
  end
end

# dealer is a type of player
class Dealer < Player

  # creates a dealer
  def initialize
    super
  end

  # reimplemented play hand for dealer
  def play_hand (deck)
    puts "\nI have: "
    display_hand
    puts "\nMy score is: #{score}\n"
    if score < 17 
      puts "I think I'll hit."
      hit deck
      play_hand deck
    else
      score
    end
  end
end

class Blackjack

  def initialize
    @decks = []
    5.times {@decks << Deck.new} # creates 5 shuffled decks
    @player = Player.new
    @dealer = Dealer.new
    @name = prompt_user  
  end

  # prompt the user and return name
  def prompt_user
    system "clear"
    puts "Hello, let's play Blackjack.  First, tell me your name: "
    name = gets.chomp
    puts "Welcome, #{name.capitalize}, get ready to lose all of your money."
    puts
    name
  end

  def play
    deck = @decks.sample # chooses a deck to play

    # add cards to players hands
    @player.hit deck
    @dealer.hit deck
    @player.hit deck
    @dealer.hit deck

    @player.play_hand deck # players turn
    if  @player.score > 21 # if player busted
      puts "I win. Hahahaha. Game Over. You lost. You're broke. Get out."
    elsif @player.score == 21 # if player hit 21
      puts "You win. Congrats.  I, uh, lost your bet, however. Sorry."
    else # if player stayed below 21
      @dealer.play_hand deck # dealers turn
      if @dealer.score > 21 # dealer busts
        puts "You win. Congrats. I, uh, lost your bet however. Sorry"
      elsif @dealer.score == 21 || @dealer.score >= @dealer.score #dealer wins
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
    return true && @player.reset_hand && @dealer.reset_hand if decision == 'yes'
    false # by default, return no
  end
end

game = Blackjack.new
nil until (game.play) == false # play blackjack until we are done
puts "Well that was fun.  Later" # takes all of the money :(
exit