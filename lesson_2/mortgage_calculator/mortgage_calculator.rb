require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
LANGUAGE = :en

def get_message(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message, is_key: true)
  message = get_message(message, LANGUAGE.to_s) if is_key
  puts("=> #{message}")
end

loop do
  prompt('welcome')

  prompt('loan_amount')

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if loan_amount.empty? || loan_amount.to_f < 0
      prompt('valid_number')
    else
      break
    end
  end

  prompt('interest_rate')
  interest_rate = ''
  loop do
    interest_rate = gets.chomp

    if interest_rate.empty? || interest_rate.to_f < 0
      prompt('valid_number')
    else
      break
    end
  end

  prompt('loan_duration')
  years = ''
  loop do
    years = gets.chomp

    if years.empty? || years.to_f < 0
      prompt('valid_number')
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12

  monthly_payment = loan_amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i()))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}", is_key: false)

  prompt('continue')
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt('thank_you')
prompt('good_bye')
