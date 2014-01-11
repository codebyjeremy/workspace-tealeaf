#Jeremy Vatter
#Pass by reference vs value
#8 January 2014

# sort array, immutable way
def foo arr
  arr.sort
end

# sort array, non immutable way
def bar arr
  arr.sort!
end

my_arr = [3,2,1]  #the array we will use, NOTE, it's reversed
puts "Sorting array, but won't change it! " + (foo my_arr).to_s
puts "Here is the array after it was passed to foo: " + my_arr.to_s

puts "Sorting array, but this WILL change it! " + (bar my_arr).to_s
puts "Here is the array after it was passed to bar: " +my_arr.to_s


# arr.sort returns a NEW array while arr.sort! changes the contents
# of the array we pass to it.  to protect immutability, or not to
# protect immutability... 