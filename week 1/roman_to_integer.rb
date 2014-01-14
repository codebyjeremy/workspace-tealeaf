# roman numeral to integer

# double checks to make sure we only have valid chars
def check_valid_input (input, valid_chars)
  other_chars = 0
  input.each_char {|char| other_chars += 1 unless valid_chars.include?(char)}
  return false unless other_chars == 0
  true
end

# attempts to ensure ordering of numerals is proper
def check_order (input)
  if input.start_with?('I')
    return false unless nil == (/[LCDM]/ =~ input)
  elsif input.start_with?('V')
    return false unless nil == (/[XLCDM]/ =~ input)
  elsif input.start_with?('X')
    return false unless nil == (/[DM]/ =~ input)
  elsif input.start_with?('L')
    return false unless nil == (/[DCM]/ =~ input)
  elsif input.start_with?('D')
    return false unless nil == (/M/ =~ input)
  end

  if input.length > 1
    check_order(input[1,input.length - 1])
  else
    true
  end
end

# adds numerals together
def add_numbers (input)
  result = 0
  num_map = {'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C'=> 100, 
    'D' => 500, 'M' => 1000}
  char_array = input.chars

  if input.include?("IX") || input.include?("IV")
    result -= 2
  end
  if input.include?("XL") || input.include?("XC")
    result -= 20
  end
  if input.include?("CD") || input.include?("CM")
    result -= 200
  end
  
  char_array.each do |char|
    result += num_map.fetch(char)
  end
  result
end

# gets a valid roman numeral string
def get_numeral (input, valid_chars)
  until (check_valid_input input, valid_chars) && (check_order input)
    puts "Input was not valid, please try again"
    input =  gets.chomp.upcase
    check_valid_input input, valid_chars
  end
  add_numbers input
end

valid = %w(C D I L M V X)

puts "Please enter a valid roman numeral"
numeral = get_numeral gets.chomp.upcase, valid
puts "Your Roman Numeral is #{numeral} in decimal."



