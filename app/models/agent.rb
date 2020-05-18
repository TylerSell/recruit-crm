class Agent < User
    has_many :candidates, :foreign_key => :agent_id 
    has_many :recruiters, :through => :candidates
    # Agent.new would save to the User table with a type of 'Agent'

end