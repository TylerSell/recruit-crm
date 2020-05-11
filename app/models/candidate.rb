class Candidate < ApplicationRecord
    belongs_to :agent
    belongs_to :recruiter

    validates :first_name, :presence => true, :length => { :minimum => 2 }
    validates :last_name, :presence => true, :length => { :minimum => 2 }
    validates :phone_number, :presence => true, :uniqueness => true,  :format => { :with => /\A\d{3}-\d{3}-\d{4}\z/, :message => "XXX-XXX-XXXX format only" }, :allow_blank => true
    validates :email, :uniqueness => { :case_sensitive => false }, :format => { :with => URI::MailTo::EMAIL_REGEXP }
    validates :date_of_birth, :interview_date, :test_date, :format => { :with => /\A\d{2}\/\d{2}\/\d{4}\z/, :message => "mm/dd/yyyy format only" }, :allow_blank => true
    validates :zip_code, :length => { :is => 5 }, :format => { :with => /\A\d{5}\z/, :message => "Zip Code must be 5 digits" }, :allow_blank => true

    scope :agent, -> (session_id) { where(agent_id: session_id) }
    scope :recruiter, -> (session_id) { where(recruiter_id: session_id) }
    scope :stage_1, -> { where(stage: 1) }
    scope :stage_2, -> { where(stage: 2) }
    scope :stage_3, -> { where(stage: 3) }
    scope :stage_4, -> { where(stage: 4) }
    scope :stage_5, -> { where(stage: 5) }
    scope :stage_6, -> { where(stage: 6) }
    scope :stage_7, -> { where(stage: 7) }
    scope :stage_8, -> { where(stage: 8) }
    scope :stage_9, -> { where(stage: 9) }
    scope :stage_10, -> { where(stage: 10) }
    scope :order_by_interview, -> { order(interview_date: :asc, first_name: :asc) }
    scope :order_by_test, -> { order(test_date: :asc, first_name: :asc) }
    scope :order_by_modified, -> { order(updated_at: :asc) }
    scope :order_by_modified_desc, -> { order(updated_at: :desc) }


end
