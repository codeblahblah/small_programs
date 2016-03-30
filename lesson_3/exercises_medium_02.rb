# Question 1
# Figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total = 0
munsters.keep_if { |name, details| details["gender"] == "male" }.values.each{|details| total += details["age"]}
munsters.keep_if { |name, details| details["gender"] == "male" }.values.inject(0){|sum, details| sum += details["age"]}

total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end


# Question 2
# Given this previously seen family hash, print out the name, age and gender of each family member:

munsters.each do |name, details|
  puts "#{name} is a #{detail["age"]} year old #{detail["gender"]}."
end

# Question 3

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Question 4
# Break up the following string and put it back together with the words in reverse order:
sentence = "Humpty Dumpty sat on a wall."
sentence.split(/\W/).reverse!join(' ') + '.'


# Question 5
# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8  #=> 34

# Questions 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)  #=> {"Herman"=>{"age"=>74, "gender"=>"other"}, "Lily"=>{"age"=>72, "gender"=>"other"}, "Grandpa"=>{"age"=>444, "gender"=>"other"}, "Eddie"=>{"age"=>52, "gender"=>"other"}, "Marilyn"=>{"age"=>65, "gender"=>"other"}}

# Pass by reference versus value. In this case, the munsters has is passed by reference and is thus modifired because the program does not reassign demo_hash -- it just uses it as-is. 

# Question 7
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")  #> "paper"

# Question 8
# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)  #=> "no"