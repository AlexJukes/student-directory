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
    puts "Please enter the name of the students."
    puts "To finish, just hit return twice."
    # create and empty array
    students = []
    # gets the first name
    name = gets.chomp
    # While the name is not empty, repeat this code
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # gte another name from the user
        name = gets.chomp
      end
      #return the array of students
      students
    end


def print_header
puts "The students of Villains Academy"
puts "----------------"
end

def print(students)
  count = 1
    while count <= @student_count
        puts students[count]
         count =count + 1
      end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

#finally, we print the total number of students
#students = input_students
print_header
print(students)
print_footer(students)
