class Candidate < ApplicationRecord
    belongs_to :agent
    belongs_to :recruiter

    scope :interested, -> { where(stage: '1')}
    scope :inteview_set, -> { where(stage: '2')}
    scope :affidavit_sent, -> { where(stage: '3')}
    scope :voucher_sent, -> { where(stage: '4')}
    scope :studying, -> { where(stage: '5')}
    scope :test_scheduled, -> { where(stage: '6')}
    scope :sent_to_contracting, -> { where(stage: '7')}
    scope :hired, -> { where(stage: '8')}
    scope :not_interested, -> { where(stage: '9')}
    scope :no_contact, -> { where(stage: '10')}
end
