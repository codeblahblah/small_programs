SUITS = [:hearts, :diamonds, :clubs, :spades].freeze
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
}.freeze

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
  cards = player_hand.flatten - SUITS
  cards[-1] = "and #{cards.last}." if cards.size > 1
  cards.join(', ')
end

def score(hand)
  hand.inject(0) { |sum, (_suit, rank)| sum + RANKS[rank] }
end

def busted?(hand)
  score(hand) > 21
end

def determine_winner(player_hand, dealer_hand)
  score(player_hand) < score(dealer_hand) ? :player : :dealer
end

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []
  answer = ''

  2.times do
    player_hand << deal_card(deck)
    dealer_hand << deal_card(deck)
  end

  prompt("Dealer has: #{dealer_hand[0].last} and unknown card")
  prompt("You have: " + show_hand(player_hand))

  loop do
    prompt("Player's turn: hit(h) or stay(s)?")
    answer = gets.chomp
    player_hand << deal_card(deck) if answer.downcase.start_with?('h')
    break if answer.downcase.start_with?('s') || busted?(player_hand)
    prompt("You have: " + show_hand(player_hand))
  end

  if busted?(player_hand)
    prompt "Player busted. Dealer wins!"
  else
    puts "You chose to stay!"
  end

  loop do
    break if busted?(player_hand)
    break if score(dealer_hand) >= 17
    dealer_hand << deal_card(deck)
    prompt "Dealer hits."
    break if busted?(player_hand)
  end

  if busted?(dealer_hand)
    prompt "Dealer busted. Player wins!"
  end

  unless busted?(player_hand) || busted?(dealer_hand)
    score(player_hand) > score(dealer_hand) ? prompt("Player wins!") : prompt("Dealer wins!")
  end

  prompt("You had: " + show_hand(player_hand))
  prompt("Dealer had: " + show_hand(dealer_hand))

  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break if answer.downcase.start_with?('y', 'n')
    prompt "Sorry, that's not a valid choice."
  end

  break if answer.downcase.start_with?('n')
end

prompt "Thanks for playing Twenty One! Good bye!"
