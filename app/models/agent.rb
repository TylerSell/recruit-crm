class Agent < User
    has_many :candidates, :foreign_key => :agent_id 
    has_many :recruiters, :through => :candidates
    # Agent.new would save to the User table with a type of 'Agent'
    validates :first_name, :presence => true, :length => { :minimum => 2 }
    validates :last_name, :presence => true, :length => { :minimum => 2 }
    validates :phone_number, :presence => true, :format => { :with => /\A\d{3}-\d{3}-\d{4}\z/, :message => "xxx-xxx-xxxx format only" }, :uniqueness => true 
    validates :email, :uniqueness => { :case_sensitive => false }, :format => { :with => URI::MailTo::EMAIL_REGEXP }

end