@students = []

COHORTS =  ["january", "february", "march", "april", "may", "june", "july", "august", "september",
            "october", "november", "december"]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"


  name = gets.chomp

  until name.empty? do

    puts "Please enter a hobby:"
    hobby = gets.chomp
    puts "Please enter a cohort"
    cohort = gets.chomp

    if !COHORTS.include?(cohort.downcase)
      cohort = "november"
    end

    @students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    puts "Now we have #{@students.count} students"

    puts "Please enter a name:"
    name = gets.chomp
  end
end

def print_students_by_cohort
  get_cohorts(@students).each do |cohort, names|
    print "\n#{cohort} cohort students: "
    names.each { |name| print "#{name}, "}
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort). Hobby: #{student[:hobby]}".center(80)
  end
end

def print_footer
  student_count = @students.count
  if student_count == 1
    puts "Overall, we have #{student_count} great student."
  else
   puts "Overall, we have #{student_count} great students"
  end
end

def get_cohorts(student_array)
  student_cohorts = {}
  student_array.each do |student|
    if student_cohorts.has_key?(student[:cohort])
      student_cohorts[student[:cohort]].push(student[:name])
    else
      student_cohorts[student[:cohort]] = [student[:name]]
    end
  end
  student_cohorts
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_students
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
    puts "I don't know what you meant, try again"
  end
end

interactive_menu
