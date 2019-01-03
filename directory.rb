def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  cohorts = ["january", "february", "march", "april", "june", "july", "august", "september","october", "november", "december"]
  name = gets.chomp
  while !name.empty? do
    puts "Please enter a cohort"
	    cohort = gets.chomp

	    if !cohorts.include?(cohort.downcase)
	      cohort = "november"
	    end

	    students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  
  students << {name: name, cohort: cohort.to_sym, hobby: hobby}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
	  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort). Hobby: #{student[:hobby]}".center(80)
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
