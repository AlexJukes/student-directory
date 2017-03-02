student_count = 11
#let's put all the students in an array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line, specifying file
  if filename.nil?
      filename = "students.csv"
    end
   #get out of the method if it isn't given
   if File.exists?(filename) # checks if the specified file exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}."
    else #if it doesn't exists
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
end

@students = []

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" #9 because we'll be adding more variables
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean."
  end
end

def interactive_menu
    try_load_students
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end


def input_students
    puts "To finish, just hit return twice."
    puts "Please enter the name of the students."
    # create and empty array
    # STDIN.gets the first name
    name = STDIN.gets.chomp
    cohort = :november
    # While the name or cohort is not empty, repeat this code
    while !name.empty? do
        add_students(name, cohort)
        puts "Now we have #{@students.count} students"
        # gte another name from the user
        name = STDIN.gets.chomp
      end
      #return the array of students
      @students
    end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end


def load_students(filename = "students.csv")
      file = File.open(filename, "r")
      file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_students(name, cohort)
      end
        file.close
    end

def print_header
puts "The students of Villains Academy"
puts "----------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end
#finally, we print the total number of students

interactive_menu
#students = input_students
#print_header
#print(students)
#print_footer(students)
