require_relative '../../db/config'

class Contact< ActiveRecord::Base

  validates :email, :format => { :with => /.+@\w+\.\w{2,4}/ },
            :uniqueness => true
  validates :phone_number_length_only_digits, numericality: {greater_than: 9, message: 'Please enter a phone number with at least 10 digits'}
  validates :company, confirmation: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.find_by_area_code
    phone_number.match(/[\d]{3}/).to_s
  end

   def phone_number_length_only_digits
      phone_number.gsub(/[^0-9]/,'').length
   end

   def to_s
      "#{self.name}\n#{self.company}\np: #{self.phone}\ne: #{self.email_address}\na: #{self.address}"
   end

end