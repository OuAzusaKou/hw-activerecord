require 'sqlite3'
require 'active_record'
require 'byebug'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'customers.sqlite3')

class Customer < ActiveRecord::Base
  def to_s
    "  [#{id}] #{first} #{last}, <#{email}>, #{birthdate.strftime('%Y-%m-%d')}"
  end


  #  NOTE: Every one of these can be solved entirely by ActiveRecord calls.
  #  You should NOT need to call Ruby library functions for sorting, filtering, etc.


  def self.any_candice
    # YOUR CODE HERE to return all customer(s) whose first name is Candice
    # probably something like:  Customer.where(....)
    con = self.where("first = 'Candice'")
    #con = self.where('Condice')
    return con
  end
  def self.with_valid_email
    # YOUR CODE HERE to return only customers with valid email addresses (containing '@')
    con = self.where("email Like '%@%'")
    return con
  end
  def self.with_dot_org_email
    return self.where("email Like '%.org%'")
  end
  def self.with_invalid_email
    return self.where("email not Like '%@%'")
  end
  def self.with_blank_email
    return self.where("email is NULL")
  end
  def self.born_before_1980
    return self.where("birthdate < '1980-01-01'")
  end
  def self.with_valid_email_and_born_before_1980
    return self.where("birthdate < '1980-01-01' AND email Like '%@%'")
  end
  def self.last_names_starting_with_b
    return self.where("last Like 'B%'").order('birthdate')
  end
  def self.twenty_youngest
    return self.order('birthdate DESC').limit(20)
  end
  # etc. - see README.md for more details
end
