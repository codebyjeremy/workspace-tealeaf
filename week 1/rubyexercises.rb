# Jeremy Vatter
# Ruby Exercises
# 8 January 2014

#1
[1,2,3,4,5,6,7,8,9,10].each {|x| puts x}

#2
[1,2,3,4,5,6,7,8,9,10].each {|x| puts x if x > 5}

#3
arr = [1,2,3,4,5,6,7,8,9,10].select {|x| x.odd?}

#4(using the value from the previous answer)
arr << 11				#append 11
arr.unshift 0		#prepend 0

#5 
arr.delete(11)
arr.delete(0)

#6
arr.uniq

#7
# The main difference between Array and Hash is that array is a collection that
# enumerates the objects inside using an interger based index.  A Hash is a collection
# of keys that are mapped to a value, so any type of object can be mapped to a key

#8
hash = {}

#9
h[:b]

#10
h.store(:e,5)

#13
h.delete_if{|k,v| v <3.5}

#14
# You can have a hash with arrays as values, and an array of hashes
arr = []

h={a:[]}
arr << {a:1}


#15
#http://ruby-doc.org/core-2.1.0/ is what I have been using as my goto API.  Its organized
#and simple to use, and it is the one I have been referencing for the last month.  It also
#has the legacy versions listed on there in the event I'm working with an old version of Ruby