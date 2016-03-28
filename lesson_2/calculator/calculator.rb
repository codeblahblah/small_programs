require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'.freeze

def get_message(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message, is_key = true)
  message = get_message(message, "#{LANGUAGE}") if is_key
  puts("=> #{message}")
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)
  word = case op
         when '1'
             'Adding'
         when '2'
             'Subtracting'
         when '3'
             'Multiplying'
         when '4'
             'Dividing'
         end
  word
end

prompt('welcome')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

prompt('"Hi #{name}!"')

loop do # main loop
  number1 = ''
  loop do
    prompt('first_number')
    number1 = gets.chomp

    break if number?(number1)
    prompt('invalid_number')
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = gets.chomp

    break if number?(number2)
    prompt('invalid_number')
  end

  operator_prompt = <<-MSG
    What operation would you like to perform
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt, false)

  operator = ''
  loop do
    operator = gets.chomp

    break if %w(1 2 3 4).include?(operator)
    prompt('choose_number')
  end

  prompt("#{operation_to_message(operator)} the two numbers...", false)

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
  end

  prompt("The result is #{result}", false)

  prompt('continue')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('good_bye')