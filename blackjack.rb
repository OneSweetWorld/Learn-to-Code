require "pry"

def say(msg)
	puts "=> #{msg}"
end

def calculate_total(cards)
	arr = cards.map{|e| e[1]}

	total = 0
	arr.each do |value|
		if value == "A"
			total += 11
		elsif value.to_i == 0 #J, Q, K
			total += 10
		else 
			total += value.to_i
		end
end

#correct for Aces
arr.select{|e| e == "A"}.count.times do
	total -= 10 if total > 21
end
total
end

#create and shuffle deck
suits = ["H", "D", "S", "C"]
cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
deck = suits.product(cards)
deck.shuffle!

#player intro
say "Hello, Welcome to Black Jack!"
say "What is your first name?"
name = gets.chomp
say "Hello, #{name}! Let's begin!"

#create hand arrays
player_hand = []
dealer_hand = []

#deal first set of cards
2.times do 
	player_hand << deck.pop
	dealer_hand << deck.pop
end

#calculate hands
playertotal = calculate_total(player_hand)
dealertotal = calculate_total(dealer_hand)

#present cards to player
say "#{name}, you have been delt #{player_hand}. Your total is #{playertotal}"
say "The dealer has been delt #{dealer_hand}. Their total is #{dealertotal}"

#player hit or stay loop
if playertotal == 21
	say "Congratulations! You have Blackjack!"
	exit
end

while playertotal < 21
	say "Your current total is #{playertotal}"
	say "What would you like to do? 1) hit 2) stay"
	stay_or_hit = gets.chomp

	if !["1", "2"].include?(stay_or_hit)
		say "Error! You must enter a 1 or a 2"
		next
	end

	if stay_or_hit == "1"
		player_hand << deck.pop
		playertotal = calculate_total(player_hand)
		say "Your new total is #{playertotal}"
	elsif stay_or_hit == "2"
		say "Your total remains at #{playertotal}"
	  break
	end
end

#dealer hit or stay loop
if dealertotal == 21
	say "Sorry, the dealer has Blackjack. You lose."
	exit
end

while dealertotal < 17
	dealer_hand << deck.pop
	dealertotal = calculate_total(dealer_hand)
end

#final hand counts
say "You have #{playertotal} and the dealer has #{dealertotal}"

#find winner
if playertotal > 21
	say "You busted. You lose."
	exit
elsif dealertotal > 21
	say "Dealer busted. You win."
	exit
elsif playertotal > dealertotal
	say "You beat the dealer. You win!"
	exit
else playertotal < dealertotal
	say "The dealer beat you. You lose."
	exit
end









