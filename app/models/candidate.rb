class Candidate < ApplicationRecord
    belongs_to :agent
    belongs_to :recruiter
end
