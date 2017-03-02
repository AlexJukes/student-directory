require 'csv'
def save_students(filename)
  # open the file for writing
 CSV::open(filename, "w") do |csv|
  # iterate over the array of students
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load_students(filename = "students.csv")
      CSV.foreach(filename) do |row|
        name, cohort = row[0],row[1]
        add_students(name, cohort)
      end
    end

def try_load_students
  filename = ARGV.first # first argument from the command line, specifying file
    if filename.nil?
      filename = "students.csv"
      end
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
  puts "3. Save the list"
  puts "4. Load the list"
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
    puts "You chose to Input Students."
    input_students
  when "2"
    puts "You chose to Show Students."
    show_students
  when "3"
    puts "You chose to Save Students."
    puts "What file do you want to save to?"
    filename = STDIN.gets.chomp
    unless filename.empty?
      save_students(filename)
    else
      puts "Cannot be blank. Please enter filename."
      filename = STDIN.gets.chomp
    end
  when "4"
    puts "You chose to Load the Students."
    puts "What file do you want to load from?"
    filename = STDIN.gets.chomp
    unless filename.empty?
      load_students(filename)
    else
      puts "Cannot be blank. Please enter filename."
      filename = STDIN.gets.chomp
    end
  when "9"
    puts "You chose to Exit. Goodbye!"
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
        puts "Enter another name."
        name = STDIN.gets.chomp
      end
      #return the array of students
      @students
    end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end



def print_header
puts "The students of Villains Academy"
puts "----------------"
end

def print_students_list
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end
#finally, we print the total number of students

interactive_menu
