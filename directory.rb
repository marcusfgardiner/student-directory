# Global alignment variables
$left = 20
$center = 40
$right = 20

@students = []

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def print_menu
    #1. Print the menu and ask what the user wants to do
    puts "---------------------".center($center)
    puts "Interactive menu - put in the number of what you want to do".center($center)
    puts "---------------------".center($center)
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "5. Fix typos in the script or add information where no value was previously provided"
    puts "9. Exit" #9 as more items to come
end

def process(selection)
    case selection
        when "1"
            input_students
        when "2"
            print_students_list
        when "3"
            save_students
        when "4"
            load_students
        when "5"
            typo_handler
        when "9"
            exit #terminates program
        else
            puts "I don't know what you meant, please try again"
    end
end

def save_students
    #open the file for writing
    file = File.open("students.csv","w")
    #iterate over array of students
    @students.each do |student|
        student_data = [student[:name], student[:cohort], student[:hobbies], student[:birth_country], student[:height]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
    puts "Student data saved"
end

def try_load_students
    filename = ARGV.first #first argument from command line is taken
    if filename.nil? #get out of method if file name not given
        filename = "students.csv"
        load_students(filename)
        if @students.count == 0
            puts "No file name provided with script and no student data yet in default file #{filename}"
        else
            puts "No file name provided with script. Loaded #{@students.count} pieces of student data from default file #{filename}"
        end
    elsif File.exists?(filename) #if file exists, do this
        load_students(filename)
        puts "Loaded #{@students.count} pieces of student data from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist"
        exit #quit program
    end
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, cohort, hobbies, birth_country, height = line.chomp.split(',')
    add_into_student_directory(name, cohort, hobbies, birth_country, height)
    end
    file.close
end

def add_into_student_directory(name, cohort, hobbies, birth_country, height)
     @students << {name: name, cohort: cohort, hobbies: hobbies, birth_country: birth_country, height: height}
            if @students.count == 1
                puts "#{@students.count} student in the directory"
            else
                puts "#{@students.count} students in the directory"
            end 
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit enter twice when prompted for a name"
    #create an empty array
    
    #get first name
    name = STDIN.gets.strip.to_sym
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
        add_into_student_directory(name, cohort, hobbies, birth_country, height)
        puts ""
        puts "If you want to enter more students, type their name now, otherwise hit enter"
        #Get another name from user
        name = STDIN.gets.strip.to_sym
        end
end



def unique_cohorts
    cohort_array = @students.map {|student| 
    student[:cohort]
    }
    cohort_array.uniq
    #Will have array of unique cohorts to iterate through => can print students based on value currently on in cohort array
    #Then need to use array of cohorts to iterate through full students array and print cohort by cohort
end

def user_input_handler
    user_input = STDIN.gets.strip.to_sym
    if user_input.empty?
        user_input = "No value provided".to_sym
    end
    user_input
end

def typo_handler
    match = false
        while match == false
        puts "Which name has a typo issue? If you wrote the name with a typo, please write the incorrectly spelled name"
        name = gets.strip.downcase.to_sym
        index_number = ""
        @students.each_with_index {|student, index|
            if student[:name].downcase.to_sym == name
                puts "Name match found, #{name}"
                index_number = index
            end
        }
        
            if index_number == ""
                puts "Name not found. If you would like to try again, write 'Yes', otherwise press enter"
                    typo_check = STDIN.gets.strip.downcase
                if typo_check == "yes"
                    match = false
                else
                    return
                end
            else
                match = true
            end
        end
        puts "Which variable has a typo? Choices are Name, Cohort, Hobbies, Country of birth and Height"
        variables_issue = STDIN.gets.strip.downcase
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
        @students[index_number][variables_issue] = user_input_handler
        puts "Typo is now fixed!"
end




def print_header
    puts "The students of Villains Academy".center($center)
    puts "----------------------".center($center)
end


def print_students_list
    if @students == []
        puts "No students provided, input some students first"
    else
    puts "Now we will print the list of students. Would you like to set any conditions as you print the list?"
    puts "If so, write 'Yes', otherwise press enter"
        conditions = STDIN.gets.strip.downcase
        if conditions == "yes"
            #Check what conditions the user wants
            puts "Firstly - Would you like to print only student names that begin with a specific letter?"
            puts "If so, type something in now and the first letter of your input will be taken, otherwise press enter"
            specific_letter = STDIN.gets.strip[0]
            puts "Secondly - Would you like to print only student names that are less than 12 characters?"
            puts "If so, write 'Yes', otherwise press enter"
            twelve_characters = STDIN.gets.strip.downcase
        end
    print_header
    
    #Print by cohort
    cohort_array = unique_cohorts
    number_excluded = 0
    number_printed = 1
    #Uses while to iterate through each one rather than each
            cohort_array.each {|unique_cohort|
                index = 0
                puts ("Cohort: " + unique_cohort.to_s).center($center)
                puts "-------".center($center)
                until (index + 1) > (@students.count)
                    #IF the cohort matches the cohort we are currently on in the cohort_array, run the printing mechanism
                    if unique_cohort == @students[index][:cohort]
                    #Print the names only if meets above user conditions and count number of exclusions
                        if (specific_letter != nil && @students[index][:name][0].downcase != specific_letter.downcase) || ((twelve_characters == "yes") && (@students[index][:name].length > 11))
                            index += 1
                            number_excluded += 1
                            next
                            #Prints index, name and cohort
                        else
                            puts ((number_printed).to_s + " - #{@students[index][:name]}").center($center)
                            puts ("Country of birth:".ljust($left) + "#{@students[index][:birth_country]}".rjust($right))
                                if @students[index][:height] == "No value provided"
                                    puts ("Height:".ljust($left) + "#{@students[index][:height]}".rjust($right))
                                else 
                                    puts ("Height:".ljust($left) + "#{@students[index][:height]} metres".rjust($right))
                                end
                            puts ("Hobbies:".ljust($left) + "#{@students[index][:hobbies]}".rjust($right))
                            index += 1 
                            number_printed += 1
                        end
                    else
                        index += 1 
                    end
                end
            }
            puts ""
        puts "Note: #{number_excluded} student(s) excluded due to applied conditions".center($center)
    print_footer
    end
end

def print_footer
    puts "----------------------".center($center)
            if @students.count == 1
                puts "Overall, we have #{@students.count} great student".center($center)
            else
                puts "Overall, we have #{@students.count} great students".center($center)
            end 
    puts "----------------------".center($center)
end

try_load_students
interactive_menu

=begin

-----each version of printing student names

students.each_with_index {|student, index|
    next if (specific_letter != nil && student[:name][0].downcase != specific_letter.downcase) || ((twelve_characters == "yes") && (student[:name].length > 11))
    puts (index + 1).to_s + " #{student[:name]} (#{student[:cohort]} cohort)"
    }
    
-----hash to test with
    
students_hash = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Hobby", birth_country: "a place", height: "10"},
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

=end
