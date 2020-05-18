class Recruiter < User
    has_many :candidates, :foreign_key => :recruiter_id 
    has_many :agents, :through => :candidates
    # Recruiter.new would save to the User table with a type of 'Recruiter'

end