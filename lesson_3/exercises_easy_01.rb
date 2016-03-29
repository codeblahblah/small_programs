# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers #=> [1, 2, 3]

# Question 2
# Describe the difference between ! and ? in Ruby. 
# Methods that end with an ! mutate the caller where as methods ending in ? are predicate methods and return either true or false.

# And explain what would happen in the following scenarios: 
# 1. what is != and where should you use it? 
# != is a not equal operator and should be used to determine if values are unequal.
# 2. put ! before something, like !user_name
# This scenario would check the truthy nature of a variable or method return value.
# 3. put ! after something, like words.uniq! 
# This scenario is a call to the uniq method which removes duplicates from the original array. i.e. mutates the caller.
# 4. put ? before something
# Is used for the ternary operator i.e. an abbreviated if..else statement
# 5. put ? after something
# Is the common Ruby syntax for predicate methods.
# 6. put !! before something, like !!user_name
# Turns an object into its boolean equivalent

# Question 3
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub('important', 'urgent')

# Question 4
# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) #=> [1, 3, 4, 5]

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) #=> [2, 3, 4, 5]

# Question 5
# Programmatically determine if 42 lies between 10 and 100.
(10..100).cover?(42) #=> true
42.between?(0,100) #=> true This is the non-Range implementation

# Question 6
# Starting with the string:
famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.
"Four score and " + famous_words

famous_words.prepend("Four score and ")

"Four score and " << famous_words

# Question 7
# Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep #=> "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

eval(how_deep) #=> 42

# Question 8
# If we build an array like this
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten!

# Question 9
# Given the hash below
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones.assoc("Barney") #=> ["Barney", 2]

# Question 10
# Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.
flintstones.each_with_index.to_h #=> {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

# Or

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

p flintstones_hash #=> {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}