class Candidate < ApplicationRecord
    belongs_to :agent
    belongs_to :recruiter

    validates :first_name, :presence => true, :length => { :minimum => 2 }
    validates :last_name, :presence => true, :length => { :minimum => 2 }
    validates :phone_number, :presence => true, :uniqueness => true,  :format => { :with => /\A\d{3}-\d{3}-\d{4}\z/, :message => "XXX-XXX-XXXX format only" }, :allow_blank => true
    validates :email, :uniqueness => { :case_sensitive => false }, :format => { :with => URI::MailTo::EMAIL_REGEXP }
    validates :date_of_birth, :interview_date, :test_date, :format => { :with => /\A\d{2}\/\d{2}\/\d{4}\z/, :message => "mm/dd/yyyy format only" }, :allow_blank => true
    validates :zip_code, :length => { :is => 5 }, :format => { :with => /\A\d{5}\z/, :message => "Zip Code must be 5 digits" }, :allow_blank => true

end
