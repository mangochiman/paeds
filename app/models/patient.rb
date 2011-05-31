class Patient < ActiveRecord::Base
    has_many:treatments, :dependent => :destroy
    has_many:discharges, :dependent => :destroy
    has_many:referrals, :dependent => :destroy
    validates_presence_of :first_name,:last_name, :age, :village,:ta,:district,:chief_complaint, 
    :guardian

    def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions=>["first_name LIKE ? || last_name LIKE ? || village LIKE ? || district
    LIKE ? || age LIKE ? || chief_complaint LIKE ? || guardian LIKE ?",search_condition,
    search_condition,
    search_condition,search_condition,search_condition, search_condition, search_condition])
    end
    
    def full_name
      self.first_name + " " + self.last_name
    end
end
