class CandidatesController < ApplicationController
    before action :find_candidate, only: [:show, :edit, :update]

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
    end 

    def edit 
    end 

    def update 
        @candidate.update(candidate_params)
        redirect_to candidate_path(@candidate)
    end 


    # --------------------------------PRIVATE METHODS BELOW-----------------------------------

    private 

    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
    end 

    def candidate_params
        params.require(:candidate).permit(:first_name, :last_name, :email, :phone_number, :address_1, :address_2, :city, :state, :zip_code, :date_of_birth, :interview_date, :test_date, :stage, :affidavit_sent, :affidavit_received, :voucher_sent, :test_passed, :licensed, :agent_id, :recruiter_id)
    end 

end
