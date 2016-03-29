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

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

wins = 0
computer_wins = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.map { |k, v| "#{v} (#{k})" }.join(', ')}")
    choice = VALID_CHOICES[gets.chomp.to_sym]

    break if VALID_CHOICES.values.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  wins += 1 if display_results(choice, computer_choice) == "You won!"
  computer_wins += 1 if display_results(choice, computer_choice) == "Computer won!"

  prompt(display_results(choice, computer_choice))

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
