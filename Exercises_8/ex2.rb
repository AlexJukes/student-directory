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
puts "The students of Villains Academy beginning with #{@letter}"
puts "----------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

puts "What letter do you want to filter by?"
@letter = gets.chomp
@letter.to_s.upcase

def first_name(students)
  students.each do |student|
    name = student[:name]
    if name[0] == @letter
      puts "#{student[:name]}"
    end
    end
  end

  def print_footer(students)
    puts "Overall, we have #{(first_name(students)).count} great students."
  end
#finally, we print the total number of students
#students = input_students
print_header
first_name(students)
#print(students)
#print_footer(students)
