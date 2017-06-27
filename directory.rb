# Put all students into an array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]
#Then print them
puts "The students of Villains Academy"
puts "-------------"
students.each {|student| puts student
}
#Finally we print the overall number of students
print "Overall, we have #{students.count} great students"
