class User < ApplicationRecord
    has_secure_password

    validates :first_name, :presence => true, :length => { :minimum => 2 }
    validates :last_name, :presence => true, :length => { :minimum => 2 }
    validates :phone_number, :presence => true, :uniqueness => true,  :format => { :with => /\A\d{3}-\d{3}-\d{4}\z/, :message => "xxx-xxx-xxxx format only" }, :allow_blank => true
    validates :email, :uniqueness => { :case_sensitive => false }, :format => { :with => URI::MailTo::EMAIL_REGEXP }
    validates :password, :length => { :within => 6..40, :message => "Password must be between 6 and 40 characters" }, :on => :create
    validates :password, :length => { :within => 6..40, :message => "Password must be between 6 and 40 characters" }, :on => :update, :unless => :password.blank?

end
