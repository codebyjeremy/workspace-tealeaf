location = '/Users/Jeremy/Desktop/pics'
Dir.chdir location

#  First we find all of the pictures to be moved.
pic_names = Dir['/Users/Jeremy/Desktop/*.jpg']
puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts
print "Downloading #{pic_names.length} file(s):  "
# This will be our counter. We'll start at 1 today, # though normally I like to count from 0.
pic_number = 1
pic_names.each do |name|
  print '.' # This is our "progress bar".
  
  copy = "_1"
  # if we already have the file, skip it so we don't overwrite it
  is_copy = true if File.exist?("#{location}/#{batch_name}0#{pic_number}.jpg") ||
    File.exist?("#{location}/#{batch_name}#{pic_number}.jpg")

  puts "#{batch_name}#{pic_number}.jpg already exists" if is_copy

  new_name = if pic_number < 10
    if is_copy
      "#{batch_name}0#{pic_number}#{copy}.jpg"
    else
      "#{batch_name}0#{pic_number}.jpg"
    end
  else
    if is_copy
      "#{batch_name}#{pic_number}#{copy}.jpg"
    else
      "#{batch_name}#{pic_number}.jpg"
    end
  end
  File.rename name, new_name
  #  Finally, we increment the counter.
  pic_number = pic_number + 1
end

puts # This is so we aren't on progress bar line. 