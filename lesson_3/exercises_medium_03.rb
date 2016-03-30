# Question 1

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block.\n\n"

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
end

# Notice that Ruby re-used the "42 object with id 85" when the value was the same.
#=> a_outer is 42 with an id of: 85 before the block.
#=> b_outer is forty two with an id of: 15592360 before the block.
#=> c_outer is [42] with an id of: 15592160 before the block.
#=> d_outer is 42 with an id of: 85 before the block.

# Notice that Ruby did NOT change the id for any of the objects between outside and inside the block
#=> a_outer id was 85 before the block and is: 85 inside the block.
#=> b_outer id was 15592360 before the block and is: 15592360 inside the block.
#=> c_outer id was 15592160 before the block and is: 15592160 inside the block.
#=> d_outer id was 85 before the block and is: 85 inside the block.

# Notice that changing the values has forced Ruby to create new objects and refer to them with original names.
#=> a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
#=> b_outer inside after reassignment is thirty three with an id of: 15592360 before and: 22281760 after.
#=> c_outer inside after reassignment is [44] with an id of: 15592160 before and: 22281740 after.
#=> d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

# Notice that Ruby re-uses the objects under the hood when it can, but uses different ones for different values.
#=> a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
#=> b_inner is thirty three with an id of: 22281760 inside the block (compared to 22281760 for outer).
#=> c_inner is [44] with an id of: 22281740 inside the block (compared to 22281740 for outer).
#=> d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).

#=> a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
#=> b_outer is thirty three with an id of: 15592360 BEFORE and: 22281760 AFTER the block.
#=> c_outer is [44] with an id of: 15592160 BEFORE and: 22281740 AFTER the block.
#=> d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.

# Notice that once we leave the block, those variables that were defined inside the block lose their meaning
#=> ugh ohhhhh
#=> ugh ohhhhh
#=> ugh ohhhhh
#=> ugh ohhhhh


# Question 2
# Let's look at object id's again from the perspective of a method call instead of a block.

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
end


#=> a_outer is 42 with an id of: 85 before the block.
#=> b_outer is forty two with an id of: 22190320 before the block.
#=> c_outer is [42] with an id of: 22190300 before the block.
#=> d_outer is 42 with an id of: 85 before the block.

#=> a_outer id was 85 before the method and is: 85 inside the method.
#=> b_outer id was 22190320 before the method and is: 22190320 inside the method.
#=> c_outer id was 22190300 before the method and is: 22190300 inside the method.
#=> d_outer id was 85 before the method and is: 85 inside the method.

#=> a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
#=> b_outer inside after reassignment is thirty three with an id of: 22190320 before and: 22189600 after.
#=> c_outer inside after reassignment is [44] with an id of: 22190300 before and: 22189580 after.
#=> d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

#=> a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
#=> b_inner is thirty three with an id of: 22189600 inside the method (compared to 22189600 for outer).
#=> c_inner is [44] with an id of: 22189580 inside the method (compared to 22189580 for outer).
#=> d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).

#=> a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
#=> b_outer is forty two with an id of: 22190320 BEFORE and: 22190320 AFTER the method call.
#=> c_outer is [42] with an id of: 22190300 BEFORE and: 22190300 AFTER the method call.
#=> d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.

#=> ugh ohhhhh
#=> ugh ohhhhh
#=> ugh ohhhhh
#=> ugh ohhhhh


# Wow, look at that. Even though we changed the values of our "outer" variables inside the method call, we still have the same values and the same object id's down here AFTER the method call as we had before it!
# This is because our method call accepts VALUES as parameters. The names we give to those values in the definition of our method are SEPARATE from any other use of those same names.
# We used the same names there for convenience (and admittedly to build some suspense and allow us to clarify this point). We could just as easily have called the first parameter of our method definition a_Fred instead of a_outer.
# The method gets the VALUES of the parameters we pass, but the parameter variables inside the method have no other relationship to those outside of the method. The names were coincidental, and confusing in a useful way.
# Our main method STILL has no access to variables that are defined inside of the method.


# Question 3

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"  #=> My string looks like this now: pumpkins
puts "My array looks like this now: #{my_array}"  #=> My array looks like this now: ["pumpkins", "rutabaga"]

# The difference lies in what Ruby does when the program executes either a String#+= operation or an Array#<< operation.
# The string operation is re-assignment and CREATES A NEW STRING OBJECT. The reference to this new object is placed in the internal variable of the method, and the method considers this new string object to be the one true string. It has forgotten about the one that was passed in now. That old stale parameter string is still remembered by the caller of the method...but the method itself has forgotten all about it.
# With the array, one array object can have any number of elements. When we attach an additional element to an array using the << operator, Ruby simply keeps using the same object that was passed in, and appends the new element to it.
# So, because the method's array variable still points to the original object, the caller's array variable and the method's array variable are still pointing at the same object, and we see the results of what happened to the array "outside" of the method.

# Question 4

def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"  #=> My string looks like this now: rutabaga
puts "My array looks like this now: #{my_array}"  #=> My array looks like this now: ["pumpkins"]

# With the Array#= assignment, our literal ['pumpkins', 'rutabaga'] array IS a new object, and we are setting the internal array variable equal to that new array literal object.

# Question 5 
# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid(color)
  color == "blue" || color == "green"
 end