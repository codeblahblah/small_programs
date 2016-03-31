# Question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting  #=> nil and not a "undefined method or local variable" exception as I expected.

# Question 2

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  # => "hi there"
puts greetings # => "hi there"

# The reason is because informal_greeting is a reference to the original object.
# The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it.
We could rather:

# we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone.
# we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.


# Question 3

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"  # => "one is: one" 
puts "two is: #{two}"  # => "two is: two" 
puts "three is: #{three}"   # => "three is: three"

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"  # => "one is: one" 
puts "two is: #{two}"  # => "two is: two" 
puts "three is: #{three}"  # => "three is: three"

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"  # => "one is: two" 
puts "two is: #{two}"  # => "two is: three" 
puts "three is: #{three}" # => "three is: one"

# Question 4
# Write a method that returns one UUID when called with no parameters.

def build_UUID
  uuid = ""
  segment = ""
  character_set = ('a'..'f').to_a + (0..9).to_a

  sections = [8, 4, 4, 4, 12]
  uuid = sections.map do |section|
            segment = ""
             section.times do 
              segment += character_set.sample.to_s 
            end
            segment
  end.join('-')
end

p uuid 

# Model solution
# def generate_UUID
#   characters = [] 
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end

# puts generate_UUID

# Question 5
#  write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  words = []
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    words << word
    break if !is_a_number?(word)
  end
  # puts words
  return true if words.size == 4
  false
end

p dot_separated_ip_address?("10.4.5.11")
p dot_separated_ip_address?("4.5.5")
p dot_separated_ip_address?("1.2.3.4.5")

# Model solution
# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   return false unless dot_separated_words.size == 4

#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     return false unless is_a_number?(word)
#   end

#   true
# end
