VALID_CHOICES = {
                  r: 'rock',
                  p: 'paper',
                  s: 'scissors',
                  S: 'spock',
                  l: 'lizard'
                }.freeze

def prompt(message)
  puts("=> #{message}")
end

def get_winner(player, computer)
  return :player if win?(player, computer)
  return :computer if win?(computer, player)
  :tie
end

def win?(first, second)
    (first == 'rock') && %w(scissors lizard).include?(second)    ||
    (first == 'paper') && %w(rock spock).include?(second)      ||
    (first == 'scissors') && %w(paper lizard).include?(second) ||
    (first == 'spock') && %w(scissors rock).include?(second)   ||
    (first == 'lizard') && %w(spock paper).include?(second)
end

def display_results(player, computer)
  winner = get_winner(player, computer)

  case winner
  when :player
    prompt "You won!"
  when :computer
    prompt "Computer won!"
  when :tie
    prompt "It's a tie!"
  end
end

wins = 0
computer_wins = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.map { |choice, abbreviation| "#{choice} (#{abbreviation})" }.join(', ')}")
    choice = VALID_CHOICES[gets.chomp.to_sym]

    break if VALID_CHOICES.values.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  wins += 1 if get_winner(choice, computer_choice) == :player
  computer_wins += 1 if get_winner(choice, computer_choice) == :computer

  display_results(choice, computer_choice)

  if wins == 5 || computer_wins == 5
    prompt("We have a winner. Final score: #{wins}; Computer: #{computer_wins}")
    break
  else
    prompt("The current score is: #{wins}; Computer: #{computer_wins}.")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
