# Put all students into an array

students_hash = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "Darth Vader",cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "Nurse Ratched", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "Michael Corleone", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "Alex DeLarge", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "Terminator", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "Freddy Krueger", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "The Joker", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "Joffrey Baratheon", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
  {name: "Norman Bates", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"}
]

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit enter twice when prompted for a name"
    #create an empty array
    students = []
    #get first name
    name = gets.strip.to_sym
        #while name is not empty, repeat code
        while !name.empty?
        #Ask for more details
        puts "What cohort are they from?"
        cohort = gets.strip.to_sym
        puts "What hobbies do they have?"
        hobbies = gets.strip.to_sym
        puts "What is their country of birth?"
        birth_country = gets.strip.to_sym
        puts "What is their height in metres?"
        height = gets.strip.to_sym
        #add student hash to the array
        students << {name: name, cohort: cohort, hobbies: hobbies, birth_country: birth_country, height: height}
            if students.count == 1
                puts "Now we have #{students.count} student"
            else
                puts "Now we have #{students.count} students"
            end 
        puts ""
        puts "If you want to enter more students, type their name now, otherwise hit enter"
        #Get another name from user
        name = gets.strip.to_sym
        end
    #return array of students as method value
    students
end


def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    left = 20
    center = 40
    right = 20
    if students == []
        puts "No students provided, exiting program"
        exit
    end
    puts "Now we will print the list of students, allowing you to first set some conditions"
    puts ""
    #Check what conditions the user wants
    puts "Would you like to print only student names that begin with a specific letter?"
    puts "If so, type something in now and the first letter of your input will be taken, otherwise press enter"
    specific_letter = gets.strip[0]
    puts "Would you like to print only student names that are less than 12 characters?"
    puts "If so, write 'Yes', otherwise press enter"
    twelve_characters = gets.strip.downcase
    puts twelve_characters
    print_header
    #Uses while to iterate through each one rather than each
    index = 0
    until (index + 1) > (students.count)
    #Print the names only if meets above user conditions
        if (specific_letter != nil && students[index][:name][0].downcase != specific_letter.downcase) || ((twelve_characters == "yes") && (students[index][:name].length > 11))
            index += 1
            next
        #Prints index, name and cohort
        else
        puts ((index + 1).to_s + " #{students[index][:name]}").center(center)
        puts ("Cohort:".ljust(left) + "#{students[index][:cohort]}".rjust(right))
        puts ("Country of birth:".ljust(left) + "#{students[index][:birth_country]}".rjust(right))
        puts ("Height:".ljust(left) + "#{students[index][:height]} metres".rjust(right))
        puts ("Hobbies:".ljust(left) + "#{students[index][:hobbies]}".rjust(right))
        index += 1
        end
    end
    print_footer(students)
end

def print_footer(students)
  puts ""
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print(students)

=begin

each version of printing student names

students.each_with_index {|student, index|
    next if (specific_letter != nil && student[:name][0].downcase != specific_letter.downcase) || ((twelve_characters == "yes") && (student[:name].length > 11))
    puts (index + 1).to_s + " #{student[:name]} (#{student[:cohort]} cohort)"
    }

=end
