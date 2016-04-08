FIRST_MOVE = :choose
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system('clear') || system('cls')
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator = ', ', joiner = 'or')
  result = ''
  arr.each_with_index do |num, index|
    result += (index >= arr.size - 1) ? "#{joiner} #{num}" : "#{num}#{separator}"
  end
  result
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def detect_threat(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |square, mark| line.include?(square) && mark == INITIAL_MARKER }.keys.first
  end
end

def strategy(brd, marker)
  square = nil

  WINNING_LINES.each do |line|
    square = detect_threat(line, brd, marker)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  square = strategy(brd, COMPUTER_MARKER)
  square ||= strategy(brd, PLAYER_MARKER)
  square ||= 5 if empty_squares(brd).include?(5)
  square ||= empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return :player
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return :computer
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def place_piece!(brd, player)
  return player_places_piece!(brd) if player == :player
  return computer_places_piece!(brd) if player == :computer
end

def alternate_player(player)
  player == :computer ? :player : :computer
end

player_wins = 0
computer_wins = 0
answer = ''
initialized_player = FIRST_MOVE

loop do
  break if initialized_player != :choose
  prompt "Would you like to play first? (y or n)"
  answer = gets.chomp
  initialized_player = if answer.downcase.start_with?('y')
                         :player
                       else
                         :computer
                       end
  prompt "Sorry, that's not a valid choice."
end

loop do
  board = initialize_board
  current_player = initialized_player

  loop do
    display_board(board)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    player_wins += 1 if detect_winner(board) == :player
    computer_wins += 1 if detect_winner(board) == :computer
  else
    prompt "It's a tie!"
  end

  if player_wins == 5 || computer_wins == 5
    prompt("We have a winner. Final score: #{player_wins}; Computer: #{computer_wins}")
    break
  else
    prompt("The current score is: #{player_wins}; Computer: #{computer_wins}.")
  end

  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break if answer.downcase.start_with?('y', 'n')
    prompt "Sorry, that's not a valid choice."
  end

  break if answer.downcase.start_with?('n')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
