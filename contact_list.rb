require_relative 'contact'
require_relative 'contact_database'
require 'csv'

def run

  userprompt = ARGV.first

  if userprompt == "help"
    puts "Here is a list of available commands:
    new - create a new contact
    list - list all contacts
    show - show a contact
    find - find a contact"
  elsif userprompt == "new"
    puts "Please enter new contact name:"
    name = $stdin.gets.chomp
    puts "Please enter new contact e-mail:"
    email = $stdin.gets.chomp
    Contact.create(name, email)
  elsif userprompt == "list"
    
  elsif userprompt == "show"

  elsif userprompt == "find"

  else
    puts "That is not a valid command."  
  end

end

run

