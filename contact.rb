# require_relative 'contacts.csv'
require 'pg'
require 'pry'

class Contact
  CONN = PG.connect({
                                host: 'ec2-23-23-215-150.compute-1.amazonaws.com',
                                port: '5432',
                                user: 'jgmlhmgqkjqhed',
                                password: 'ys790lA4cHxoq9Eg9D11MFtlVI',
                                dbname: 'd27esd6lc6jbes'
                            })
  attr_accessor :fist_name, :last_name, :email 
  attr_reader :id
 
  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @id = id
  end
 
  def is_new?
    @id.nil?
  end

  def save
    if is_new?
      result = CONN.exec_params('INSERT INTO contacts (first_name, last_name, email) VALUES ($1, $2, $3) returning id', [@first_name, @last_name, @email])
      @id = result[0]['id']
      # binding.pry
    else
      CONN.exec_params('UPDATE contacts SET first_name = $1, last_name = $2, email = $3 WHERE id = $4', [@first_name, @last_name, @email, @id])
    end
  end

  def self.find(id)
    result = nil
    CONN.exec_params('SELECT id, first_name, last_name, email FROM contacts WHERE id = $1 LIMIT 1', [id]) do |rows|
      rows.each do |row|
        result = Instructor.new(
            row['first_name'],
            row['last_name'],
            row['email'],
            row['id']
        )
      end
    end
    result
  end

  def self.find_all_by_last_name(last_name)
    result = []
    CONN.exec_params('SELECT id, first_name, last_name, email FROM contacts WHERE last_name = $1 ', [last_name]) do |rows|
      rows.each do |row|
        result << Contact.new(
            row['first_name'],
            row['last_name'],
            row['email']
        )
      end
    end
    p result
  end

  def self.find_all_by_first_name(name)
  end

  def self.find_all_by_email(email)
  end
  def self.destroy(id)
     CONN.exec_params('DELETE FROM contacts WHERE id = $1', [id])
  end

  # def to_s
  #   # TODO: return string representation of Contact
  #   # @string_version = self.to_s
  # end
 
  ## Class Methods
  # class << self

  #   def create(name, email)
  #     # TODO: Will initialize a contact as well as add it to the list of contacts
  #     contact = [name, email]
  #     ContactDatabase.write_contact(contact)
  
  #   end
 
  #   def find(index)
  #     # TODO: Will find and return contact by index

  #   end
 
  #   def all
  #     # TODO: Return the list of contacts, as is
  #   end
    
  #   def show(id)
  #     # TODO: Show a contact, based on ID
  #   end
    
  # end
 
end
jim = Contact.new("first_name", "last_name", "email")
roger = Contact.new('roger', 'richards', 'roger@yahoo.ca')
roger.save
puts jim 
p jim 
p jim.save
p jim.save
p Contact.find_all_by_last_name("last_name")
Contact.destroy(1)
