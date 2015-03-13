require_relative 'contacts.csv'

class Contact
 
  attr_accessor :name, :email
 
  def initialize(name, email)
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
    self.to_s
  end
 
  ## Class Methods
  class << self

    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      contact = [name, email]
      
      CSV.open('contacts.csv', 'w') do |csv_object|
        csv_object << contact
      end
    end
 
    def find(index)
      # TODO: Will find and return contact by index
    end
 
    def all
      # TODO: Return the list of contacts, as is
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end