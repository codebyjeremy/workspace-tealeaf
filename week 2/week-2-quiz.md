Week 2 Quiz

1) Name what each of the below is:

@a = 2 -> instance variable being assigned 2 as value
user = User.new -> initializes a new object of Class User
user.name -> returns :name
user.name = "Joe" -> assigns "Joe" to :name

2) How does a class mixin a module

module MyMod
end

class MyClass
  include MyMode
end

3) What's the difference between class variables and instance variables

Class variables are visable to the entire class, where instance variables are only visable according to the local scope

4) What does attr_accessor do?

Automates getter / setter methods for a class variable

5) How would you describe: Dog.some_method

Dog.some_method would perform the method indicated in the Dog class

6) Whats the difference between subclassing and mixing in modules?

Subclassing is when you want a class to inherit all behaviors of the parent class.  Mixing is when you want to inherit particular methods of a particular class.

7) If you can instantiate User.new('Bob'), what would the initialize method look like?

def initialize (name)
  self.name = name
end

8) Can you call instance methods of the same class from other instance methods in that class?

Yes

9) When you get stuck, how do you trap errors?

Typically I look at the error ouput and trace the error from there.  It's easy if it is a syntactical error, otherwise for logical errors I generally put print statements before and after my hypothesized problem areas in the code.  I use built in debuggers on occassion, but doing print statements work equally the same without having to step through parts of the code.  The hardest part during the blackjack game was getting errors resolved for particular scenariors.  In those cases, I hardcode in values to force scenarios to happen.