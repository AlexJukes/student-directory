@student_count = 11
#let's put all the students in an array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november,
  hobbies: "Eating (with) friends", country: "USA"},
{name: "Darth Vader", cohort: :november,
  hobbies: "Asphyxiation", country: "Tatoonie (Planet)"},
{name: "Nurse Ratched", cohort: :november,
  hobbies: "Patient welfare", country: "USA"},
{name: "Michael Corleone", cohort: :november,
  hobbies: "Spending time with family", country: "USA"},
{name: "Alex DeLarge", cohort: :november,
  hobbies: "Drinking milk, watching films", country: "UK"},
{name: "The Wicked Witch of the West", cohort: :november,
  hobbies: "Training monkeys", country: "Oz"},
{name: "Terminator", cohort: :november,
  hobbies: "Time travel", country: "SkyNet"},
{name: "Freddy Krueger", cohort: :november,
  hobbies: "Bush pruning", country: "Dreamland"},
{name: "The Joker", cohort: :november,
  hobbies: "Japes", country: "Unknown"},
{name: "Joffrey Baratheon", cohort: :november,
  hobbies: "Archery", country: "Westeros"},
{name: "Norman Bates", cohort: :november,
  hobbies: "Spending time with Mom", country: "USA"}
]

def input_students
    # create and empty array
  @students = []

 # Gets all input from the user
  def get_input
    # gets the first name
    def get_name
    puts "Please enter the name of the students."
    @name = gets.chomp
      end

    # Gets cohort
    def get_cohort
    puts "Please enter the cohort they will be joining."
    @cohort = gets.chomp
      end

    # Checks input
    def check
      puts "#{@name} will be joining #{@cohort} cohort. Is this correct? Y/N"
    @correct = gets.chomp
      if @correct == "Y" || @correct == "y"
        @students << {name: @name, cohort: @cohort}
        puts "Now we have #{(@students.count)} students"
          end
        end

    #Checks if the user wants to continue
    def continue
      puts "Would you like to enter another name? Y/N"
      @cont = gets.chomp
      end

   #Ask the user for all relevant inputs and checks.
    get_name
    get_cohort
    check
    continue
  end

  # Keeps asking for input until user chooses not to continue
    get_input
      until @cont == "N" || @cont == "n"
        get_input
      end
      #return the array of students
      @students
    end


def print_header
puts "The students of Villains Academy"
puts "----------------"
end

def count(students)
  count = 1
    while count <= @student_count
        puts (students[count])
         count =count + 1
      end
end

# Creates new hash to store students in each month
def print_cohorts(students)
  require 'date'
  #Returns an array containing only the unique months
  cohorts = (students.map {|student| student[:cohort]}.uniq)
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  cohorts.sort_by! {|x| months.index(x)}
  #Iterates over the cohort array and puts each month
  cohorts.each do |cohort|
    puts "In #{cohort} we have "
# This returns an array only of students that match the month.
     student_month = students.select do |student|
     student[:cohort] == cohort
     end
     student_month.each do |student|
       puts student[:name]
     end

  end
end





def print(students)
  @students.drop(1).each do |student|
    names = student[:name]

  end
end

def print_footer(students)
  puts "Overall, we have #{(@students.count)} great students."
end

#finally, we print the total number of students
students = input_students
#print_header
#print(students)
#count(students)
#print_footer(students)
print_cohorts(students)
