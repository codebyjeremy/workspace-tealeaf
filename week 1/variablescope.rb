#Jeremy Vatter
#Variable Scope
#8 January 2014

#1
arr=[]
1.upto(3) do
		puts arr.empty?
		arr.push(1)
end
#Variable will change
puts arr.join


#2
1.upto(3) do
		x=2
		puts x-=1
end

#puts x  <-- we have no access to x at this scope, ruby will crash

#if you nest do/end blocks, all blocks within the nest will have
#access to any and all variables from the nest previous and before.
#the further in you go, the more defined the scope is, and nested blocks
#outside of the nest will not have access to those variables.
