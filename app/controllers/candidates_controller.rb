class CandidatesController < ApplicationController
    # before action :find_candidate, only: [:show, :edit, :update]

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
        @agent = Agent.find_by(id: @candidate.agent_id)
        @recruiter = Recruiter.find_by(id: @candidate.recruiter_id)
    end 

    def edit 
    end 

    def update 
        @candidate.update(candidate_params)
        redirect_to candidate_path(@candidate)
    end 

    def destroy
        @candidate.delete
        if is_agent?
            redirect_to agents_path
        else 
            redirect_to recruiters_path
        end
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
