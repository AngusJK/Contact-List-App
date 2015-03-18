require_relative 'contact'
require_relative 'contact_database'
require 'csv'

#def run

  user_input = ARGV.first
  puts "Reading from #{ContactDatabase::CSV_FILE}."
  if user_input == "help"
    puts "Here is a list of available commands:
    new - create a new contact
    list - list all contacts
    show - show a contact
    find - find a contact"
  elsif user_input == "new"
    puts "Please enter new contact name:"
    name = $stdin.gets.chomp
    puts "Please enter new contact e-mail:"
    email = $stdin.gets.chomp
    Contact.create(name, email)
  elsif user_input == "list"
    p CSV.read('contacts.csv')
  elsif user_input == "show"
    p Contact.show()
  elsif user_input == "find"

  else
    puts "That is not a valid command."  
  end

#end

#run

