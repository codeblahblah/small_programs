# Question 1
# In this hash of people and their age, 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if there is an age present for "Spot".
ages.key?("Spot") #=> false
ages.has_key?("Spot") #=> false

ages.include?("Spot") #=> false
ages.member?("Spot") #=> false

# Question 2
# Add up all of the ages from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.reduce(:+)

# Question 3
# In the age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

#throw out the really old people (age 100 or older).
ages.reject { |_, age| age >=100 }
ages.keep_if { |name, age| age < 100 }


# Question 4
# Starting with this string:
munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original munsters_description above):

munsters_description.capitalize! #=> "The munsters are creepy in a good way."
munsters_description.swapcase! #=> "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.downcase! #=> "the munsters are creepy in a good way."
munsters_description.upcase! #=> "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

#Question 5

# We have most of the Munster family in our age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages) #=> {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}

# Question 7
# See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?('Dino') #=> false
advice.match("Dino") # Model answer

# Question 8
# In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#Find the index of the first name that starts with "Be"
flintstones.index { |name| name[0, 2] == "Be" }

# Question 9
# Using array#map!, shorten each of these names to just 3 characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map!do |name|
  name[0, 3]
end

# Question 10
# Again, shorten each of these names to just 3 characters -- but this time do it all on one line:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map!{ |name| name[0, 3] }