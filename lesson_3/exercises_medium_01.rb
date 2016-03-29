# Question 1
# Write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:
# 10.times { |i| puts " " * i + 'The Flintstones Rock!'} 

# Question 2
# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

frequency = Hash.new(0)
statement.chars.each do |chars|
  frequency[chars] += 1 unless chars == " "
end

p frequency

frequency1 = Hash.new(0)
statement.gsub(/\s+/, "").chars.each do |chars|
  frequency1[chars] += 1
end

p frequency1

# Using Enumerable#each_with_object
statement.gsub(/\s+/, "").chars.each_with_object(Hash.new(0)) { |c,h| h[c] += 1 }

# Model answer
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
# Question 3
# The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2)  #=> TypeError: no implicit conversion of Fixnum into String


# Why is this and what are two possible ways to fix this?
# The expression (40 + 2) returns an integer which must have a to_s call in order to be concatenated to a string
# It can be fixed by:
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}"


# Question 4
# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

#=> "0  [1, 2, 3, 4]  1"

# Results in erratic behaviour

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

#=> "1  [2, 3, 4]  3"

# In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time.

# Question 5
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end


# Bonus 1
# What is the purpose of the number % dividend == 0 ?
# Model answer: Allows you to determine if the result of the division is an integer number (no remainder).

# Bonus 2
# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
# This is an explicit return statement (which 'returns' the array populated with the factors).

# Question 6

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# "Take your pick. Do you like << or + for modifying the buffer?"

# Yes, there is a difference.
# While both methods have the same return value, in the first implementation,
# the input argument called buffer will be modified and will end up being changed after rolling_buffer1 returns.
# That is, the caller will have the input array that they pass in be different once the call returns.
# In the other implementation, rolling_buffer2 will not alter the caller's input argument.

# Question 8
# What's wrong with the code?
# The limit variable is in the outer scope of the fib method. 
# You can make limit an additional argument to the definition of the fib method and pass it in when you call fib.

def fib(first_num, second_num, limit = 15)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# Question 8
# Write your own version of the rails titleize implementation.
string.split.map(&:capitalize).join(' ')

# Question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). 

munsters.each do |_, info| 
  case info["age"]
  when 0..18 then info["age_group"] = "kid"
  when 18..65 then info["age_group"] = "adult"
  else info["age_group"] = "senior"
  end
end