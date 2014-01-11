#chapter 10

#sorting again

def sortSomeArray someArray
  recursiveSort someArray, []
end

def recursiveSort unsortedArray, sortedArray
  #it's sorted if it only has 1 element
  if unsortedArray.length<=1
    return unsortedArray
  end

  tempElement = unsortedArray.pop
  tempArray=[]

  #push biggest elements into list first
  unsortedArray.each do |element|
    if tempElement > element
      tempArray.push tempElement
      tempElement = element
    else #tempElement is smaller
      tempArray.push element
    end
  end

  sortedArray.push tempElement
  recursiveSort tempArray, sortedArray

  return sortedArray
end

puts sortSomeArray(["dog", "Cat", "bug", "squirrel"])

#shuffle
def shuffle array
  returnArray=[]
  while !(array.empty?)
    chosenOne = rand(array.length)
    returnArray.push array[chosenOne]
    array.delete_at(chosenOne)
  end

  return returnArray
end

puts shuffle([1,2,3,4,5,6])

#dictionarySort
def dictionarySort someArray
  otherSort someArray, []
end

def otherSort unsortedArray, sortedArray
  #it's sorted if it only has 1 element
  if unsortedArray.length<=1
    return unsortedArray
  end

  tempElement = unsortedArray.pop
  tempArray=[]

  #push biggest elements into list first
  unsortedArray.each do |element|
    if tempElement.downcase > element.downcase
      tempArray.push tempElement
      tempElement = element
    else #tempElement is smaller
      tempArray.push element
    end
  end

  sortedArray.push tempElement
  recursiveSort tempArray, sortedArray

  return sortedArray
end

puts dictionarySort(["dog", "Cat", "bug", "Squirrel"])

def english_number number
  if number < 0 #no negatives
    return 'Please enter a number that isn\'t negative.'
  end

  if number == 0
    return 'zero'
  end

  num_string = ''
  ones_place = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  tens_place = ['ten', 'twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
  teenagers=['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

  #left is amount of number we need to still write
  #write is the part we have written

  left = number

  write = left/1000000000000
  left -= write*1000000000000

  if write>0
    trillions = english_number write
    num_string+= trillions + ' trillion'
    if left >0
      num_string += ' '
    end
  end

  write = left/1000000000
  left -= write*1000000000

  if write>0
    billions = english_number write
    num_string+= billions + ' billion'
    if left >0
      num_string += ' '
    end
  end

  write = left/1000000
  left -= write*1000000

  if write>0
    millions = english_number write
    num_string+= millions + ' million'
    if left >0
      num_string += ' '
    end
  end

  write = left/1000
  left -= write*1000

  if write>0
    thousands = english_number write
    num_string+= thousands + ' thousand'
    if left >0
      num_string += ' '
    end
  end

  write = left/100
  left = left - write*100 #get rid of 100s

  if write > 0
    hundreds = english_number write
    num_string+= hundreds + ' hundred'
    if left > 0
      num_string += ' '
    end
  end

  write = left/10
  left -= write*10 #get rid of 10s

  if write >0
    if ((write == 1) and (left > 0))
      num_string+= teenagers[left-1]
      left = 0
    else
      num_string += tens_place[write-1]
    end
    if left>0
      num_string += ' '
    end
  end

  write = left
  left = 0

  if write > 0 
    num_string += ones_place[write-1]
  end

  #return numstring like
  num_string
end

puts english_number(555)
puts english_number(1000)
puts english_number(10000)
puts english_number(999999)
puts english_number(2000000000000)

#99 Bottles of Beer on the Wall
beer = 4
while (beer >=2 )
  puts english_number(beer) + " bottles of beer on the wall, " + english_number(beer) + " bottles of beer, yadda yadda"
  beer = beer -1
  puts english_number(beer) + " bottles of beer on the wall"
end

puts english_number(beer) + " bottle of beer on the wall, " + english_number(beer) + " bottle of beer, yadda yadda"
