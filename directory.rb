# Put all students into an array

students_hash = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader",cohort: :november},
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
    puts "Please enter the names of the students"
    puts "To finish, just hit enter twice"
    #create an empty array
    students = []
    #get first name
    name = gets.chomp
        #while name is not empty, repeat code
        while !name.empty?
        #add student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        #Get another name from user
        name = gets.chomp
        end
    #return array of students as method value
    students
end


def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    #Check what conditions the user wants
    puts "Would you like to print only student names that begin with a specific letter?"
    puts "If so, type something in now and the first letter of your input will be taken, otherwise press enter"
    specific_letter = gets.chomp[0]
    puts "Would you like to print only student names that are less than 12 characters?"
    puts "If so, write 'Yes', otherwise press enter"
    twelve_characters = gets.chomp.downcase
    puts twelve_characters
    print_header
    #Print the names based on the above conditions
    students.each_with_index {|student, index|
    next if (specific_letter != nil && student[:name][0].downcase != specific_letter.downcase) || ((twelve_characters == "yes") && (student[:name].length > 11))
    puts (index + 1).to_s + " #{student[:name]} (#{student[:cohort]} cohort)"
    }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = students_hash
print(students)
print_footer(students)


