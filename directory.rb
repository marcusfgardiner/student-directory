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

$left = 20
$center = 40
$right = 20

def user_input_handler
    user_input = gets.strip.to_sym
    if user_input.empty?
        user_input = "No value provided".to_sym
    end
    user_input
end

def typo_handler(students)
    match = false
    puts "From looking at the directory, are there any typos or would you like to add any values where there isn't currently one?"
    puts "If so, write 'Yes', otherwise press enter"
        typo_check = gets.strip.downcase
        if typo_check != "yes"
            puts "Perfect, no typos - list confirmed"
        else
            while match == false
            puts "Which name has a typo issue? If you wrote the name with a typo, please write the incorrectly spelled name"
            name = gets.strip.downcase.to_sym
            index_number = ""
            students.each_with_index {|student, index|
                if student[:name].downcase == name
                    puts "Name match found, #{name}"
                    index_number = index
                end
            }
            
                if index_number == ""
                    match = false
                    puts "Name not found, try again"
                else
                    match = true
                end
            end
            puts "Which variable has a typo? Choices are Name, Cohort, Hobbies, Country of birth and Height"
            variables_issue = gets.strip.downcase
                if variables_issue == "name"
                    variables_issue = :name
                elsif variables_issue == "cohort"
                    variables_issue = :cohort
                elsif variables_issue == "hobbies"
                    variables_issue = :hobbies
                elsif variables_issue == "country of birth"
                    variables_issue = :birth_country
                elsif variables_issue == "height"
                    variables_issue = :height
                end
            puts "What should value be changed to?"
            students[index_number][variables_issue] = user_input_handler
            puts "Typo is now fixed!"
            print(students)
        end
end

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
        cohort = user_input_handler
        puts "What hobbies do they have?"
        hobbies = user_input_handler
        puts "What is their country of birth?"
        birth_country = user_input_handler
        puts "What is their height in metres?"
        height = user_input_handler
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
    puts "The students of Villains Academy".center($center)
    puts "----------------------".center($center)
end


def print(students)
    if students == []
        puts "No students provided, exiting program"
        exit
    end
    puts "Now we will print the list of students. Would you like to set any conditions as you print the list?"
    puts "If so, write 'Yes', otherwise press enter"
        conditions = gets.strip.downcase
        if conditions == "yes"
            #Check what conditions the user wants
            puts "Firstly - Would you like to print only student names that begin with a specific letter?"
            puts "If so, type something in now and the first letter of your input will be taken, otherwise press enter"
            specific_letter = gets.strip[0]
            puts "Secondly - Would you like to print only student names that are less than 12 characters?"
            puts "If so, write 'Yes', otherwise press enter"
            twelve_characters = gets.strip.downcase
        end
    print_header
    #Uses while to iterate through each one rather than each
    index = 0
    number_excluded = 0
    until (index + 1) > (students.count)
    #Print the names only if meets above user conditions
        if (specific_letter != nil && students[index][:name][0].downcase != specific_letter.downcase) || ((twelve_characters == "yes") && (students[index][:name].length > 11))
            index += 1
            number_excluded += 1
            next
        #Prints index, name and cohort
        else
        puts ((index + 1).to_s + " - #{students[index][:name]}").center($center)
        puts ("Cohort:".ljust($left) + "#{students[index][:cohort]}".rjust($left))
        puts ("Country of birth:".ljust($left) + "#{students[index][:birth_country]}".rjust($right))
            if students[index][:height] = "No value provided"
                puts ("Height:".ljust($left) + "#{students[index][:height]}".rjust($right))
            else 
                puts ("Height:".ljust($left) + "#{students[index][:height]} metres".rjust($right))
            end
        puts ("Hobbies:".ljust($left) + "#{students[index][:hobbies]}".rjust($right))
        index += 1
        end
    end
            puts ""
        puts "Note: #{number_excluded} student(s) excluded due to applied conditions".center($center)
    print_footer(students)
    typo_handler(students)
end

def print_footer(students)
    puts "----------------------".center($center)
            if students.count == 1
                puts "Overall, we have #{students.count} great student".center($center)
            else
                "Overall, we have #{students.count} great students".center($center)
            end 
    puts "----------------------".center($center)
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
