SUITS = [:hearts, :diamonds, :clubs, :spades]
RANKS = {
  ace: 11,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9,
  ten: 10,
  jack: 10,
  queen: 10,
  king: 10
}

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(RANKS.keys).shuffle
end

def deal_card(deck)
  deck.pop
end

def show_hand(player_hand)
  cards = ""
  player_hand.each_with_index do |(suit, rank), index|
    cards += player_hand[index].last.to_s
    cards += ' and ' unless index >= player_hand.size - 1
  end
  cards
end

def score(hand)
  hand.inject(0) { |total, (_suit, rank)| total += RANKS[rank] }
end

def busted?(hand)
  score(hand) > 21
end

# def display_result()

# end

def determine_winner(player_hand, dealer_hand)
  score(player_hand) < score(dealer_hand) ? :player : :dealer
end

loop do
  # 1. Initialize deck
  deck = initialize_deck

  # 2. Deal cards to player and dealer
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deal_card(deck)
    dealer_hand << deal_card(deck)
  end

  prompt("Dealer has: #{dealer_hand[0].last} and unknown card")
  prompt("You have: " + show_hand(player_hand))

  # 3. Player turn: hit or stay
  answer = ''
  loop do
    prompt("Player's turn: hit(h) or stay(s)?")
    answer = gets.chomp
    player_hand << deal_card(deck) if answer.downcase.start_with?('h')
    break if answer.downcase.start_with?('s') || busted?(player_hand)
    prompt("You have: " + show_hand(player_hand))
  end

  if busted?(player_hand)
    prompt("You have: " + show_hand(player_hand))
    prompt("Dealer has: " + show_hand(dealer_hand))
    # probably end the game? or ask the user to play again?
    prompt "Player busted. Dealer wins!"
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  else
    puts "You chose to stay!" # if player didn't bust, must have stayed to get here
  end

  prompt("Dealer's turn")

  loop do
    break if busted?(player_hand)
    break if score(dealer_hand) >= 17
    dealer_hand << deal_card(deck)
    prompt "Dealer hits."
    break if busted?(player_hand)
  end

  if busted?(dealer_hand)
    prompt "Game over. Player wins!"
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  else
    score(player_hand) > score(dealer_hand) ? prompt("Player wins!") : prompt("Dealer wins!")
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

prompt "Thanks for playing Twenty One! Good bye!"