require_relative '../../db/config'

class Contact< ActiveRecord::Base

  validates :email, :format => { :with => /.+@\w+\.\w{2,4}/ },
            :uniqueness => true
  validates :phone, :format => { :with => /[0-9]{10,}/ }


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.find_by_area_code(condition, value)
    ## e.g. LIKE '%312'
    data = $db.execute("SELECT * from contacts where phone LIKE ?",value
    fetch_contact(data)
  end

  def self.fetch_contact(data)
    data.map do |attributes|
      Student.new( Hash[attributes.map { |k,v| [k.to_sym, v] }] )
    end
  end

end