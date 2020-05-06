class CandidatesController < ApplicationController
    # EVEN THOUGH THIS IS A BEFORE ACTION EXCLUDING :NEW, :INDEX, :CREATE THE NEW PATH STILL HITS THIS LINE AND THROWS A WRONG NUMBER OF ARGS ERROR
    # before_action :find_candidate, only: [:edit, :show, :update]
    helper_method :interested 

    def index
        @candidates = Candidate.all 
    end
    
    def new 
        @candidate = Candidate.new 
    end 

    def create 
        @candidate = Candidate.create(candidate_params)
        
        if @candidate.save
            redirect_to candidate_path(@candidate)
        else 
            render :new 
        end 
    end 

    def show 
        @candidate = Candidate.find_by(id: params[:id])
        @agent = Agent.find_by(id: @candidate.agent_id)
        @recruiter = Recruiter.find_by(id: @candidate.recruiter_id)
    end 

    def edit 
        @candidate = Candidate.find_by(id: params[:id])
    end 

    def update 
        @candidate = Candidate.find_by(id: params[:id])
        @candidate.update(candidate_params)
        redirect_to candidate_path(@candidate)
    end 

    def destroy
        @candidate = Candidate.find_by(id: params[:id])
        @candidate.delete
        redirect_to candidates_path
    end


    # --------------------------------PRIVATE METHODS BELOW-----------------------------------

    private 

    # FOR WHATEVER REASON ERROR CREATED WHEN HIT THE NEW PATH WITH A WRONG NUMBER OF ARGS ERROR
    # def find_candidate
    #     @candidate = Candidate.find_by(id: params[:id])
    # end 

    def candidate_params
        params.require(:candidate).permit(:first_name, :last_name, :email, :phone_number, :address_1, :address_2, :city, :state, :zip_code, :date_of_birth, :interview_date, :test_date, :stage, :affidavit_sent, :affidavit_received, :voucher_sent, :test_passed, :licensed, :agent_id, :recruiter_id)
    end 

    # def interested
    #     @interested = Candidate.all.where(stage: '1')
    # end

    # scope :interested, -> { where(stage: '1')}
    # scope :inteview_set, -> { where(stage: '2')}
    # scope :affidavit_sent, -> { where(stage: '3')}
    # scope :voucher_sent, -> { where(stage: '4')}
    # scope :studying, -> { where(stage: '5')}
    # scope :test_scheduled, -> { where(stage: '6')}
    # scope :sent_to_contracting, -> { where(stage: '7')}
    # scope :hired, -> { where(stage: '8')}
    # scope :not_interested, -> { where(stage: '9')}
    # scope :no_contact, -> { where(stage: '10')}

end
