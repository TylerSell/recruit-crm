class CandidatesController < ApplicationController
    # EVEN THOUGH THIS IS A BEFORE ACTION EXCLUDING :NEW, :INDEX, :CREATE THE NEW PATH STILL HITS THIS LINE AND THROWS A WRONG NUMBER OF ARGS ERROR
    # before_action :find_candidate, only: [:edit, :show, :update]
    layout "sidebar"

    def index
        if is_agent?
            agent_candidates
        else 
            recruiter_candidates
        end
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
        if @candidate.update(candidate_params)
            redirect_to candidate_path(@candidate)
        else 
            render :edit 
        end
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

    def agent_candidates
        @candidates_1 = Candidate.agent(session[:user_id]).stage_1.order_by_modified
        @candidates_2 = Candidate.agent(session[:user_id]).stage_2.order_by_interview
        @candidates_3 = Candidate.agent(session[:user_id]).stage_3.order_by_modified
        @candidates_4 = Candidate.agent(session[:user_id]).stage_4.order_by_modified
        @candidates_5 = Candidate.agent(session[:user_id]).stage_5.order_by_modified
        @candidates_6 = Candidate.agent(session[:user_id]).stage_6.order_by_test
        @candidates_7 = Candidate.agent(session[:user_id]).stage_7.order_by_test
        @candidates_8 = Candidate.agent(session[:user_id]).stage_8.order_by_modified_desc
        @candidates_9 = Candidate.agent(session[:user_id]).stage_9.order_by_modified_desc
        @candidates_10 = Candidate.agent(session[:user_id]).stage_10.order_by_modified_desc
    end

    def recruiter_candidates
        @candidates_1 = Candidate.recruiter(session[:user_id]).stage_1.order_by_modified
        @candidates_2 = Candidate.recruiter(session[:user_id]).stage_2.order_by_interview
        @candidates_3 = Candidate.recruiter(session[:user_id]).stage_3.order_by_modified
        @candidates_4 = Candidate.recruiter(session[:user_id]).stage_4.order_by_modified
        @candidates_5 = Candidate.recruiter(session[:user_id]).stage_5.order_by_modified
        @candidates_6 = Candidate.recruiter(session[:user_id]).stage_6.order_by_test
        @candidates_7 = Candidate.recruiter(session[:user_id]).stage_7.order_by_modified
        @candidates_8 = Candidate.recruiter(session[:user_id]).stage_8.order_by_modified_desc
        @candidates_9 = Candidate.recruiter(session[:user_id]).stage_9.order_by_modified_desc
        @candidates_10 = Candidate.recruiter(session[:user_id]).stage_10.order_by_modified_desc
    end

end
