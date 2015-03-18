require 'csv'

class ContactDatabase
  
  CSV_FILE = 'contacts.csv'
  
  def self.read_contacts
    contacts = CSV.read(CSV_FILE)
  end

  def self.write_contact(contact) 
    CSV.open(CSV_FILE, 'w') do |csv_object|
        csv_object << contact
      end
  end

end
