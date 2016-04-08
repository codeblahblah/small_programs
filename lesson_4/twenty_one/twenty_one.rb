SUITS = [:hearts, :diamonds, :clubs, :spades].freeze
RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(RANKS).shuffle
end

def deal_card(deck)
  deck.pop
end

def score(hand)
  values = hand.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'Ace'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(hand)
  score(hand) > 21
end

def determine_winner(player_hand, dealer_hand)
  player_total = score(player_hand)
  dealer_total = score(dealer_hand)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(player_hand, dealer_hand)
  result = determine_winner(player_hand, dealer_hand)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "----------"
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  prompt "Welcome to Twenty-One!"

  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deal_card(deck)
    dealer_hand << deal_card(deck)
  end

  prompt "Dealer has: #{dealer_hand[0]} and unknown card."
  prompt "You have: #{player_hand[0]} and #{player_hand[1]}, for a total of #{score(player_hand)}."

  loop do
    player_turn = nil
    loop do
      prompt("Player's turn: hit(h) or stay(s)?")
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_hand << deal_card(deck)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_hand}"
      prompt "You score is now: #{score(player_hand)}"
    end

    break if player_turn == 's' || busted?(player_hand)
  end

  if busted?(player_hand)
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  else
    puts "You chose to stay at #{score(player_hand)}"
  end

  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_hand) || score(dealer_hand) >= 17

    prompt "Dealer hits!"
    dealer_hand << deal_card(deck)
    prompt "Dealer's cards are now: #{dealer_hand}"
  end

  if busted?(dealer_hand)
    prompt "Dealer total is now: #{score(dealer_hand)}"
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{score(dealer_hand)}"
  end

  puts "=============="
  prompt "Dealer has #{dealer_hand}, for a total of: #{score(dealer_hand)}"
  prompt "Player has #{player_hand}, for a total of: #{score(player_hand)}"
  puts "=============="

  display_result(player_hand, dealer_hand)
  break unless play_again?
end

prompt "Thanks for playing Twenty One! Good bye!"
