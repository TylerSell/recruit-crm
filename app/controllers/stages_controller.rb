class StagesController < ApplicationController

    def stage_1
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_1.order_by_modified
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_1.order_by_modified 
        end
    end

    def stage_2
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_2.order_by_interview
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_2.order_by_interview 
        end
    end

    def stage_3
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_3.order_by_modified
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_3.order_by_modified 
        end
    end

    def stage_4
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_4.order_by_modified
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_4.order_by_modified 
        end
    end

    def stage_5
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_5.order_by_modified
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_5.order_by_modified 
        end
    end

    def stage_6
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_6.order_by_test
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_6.order_by_test 
        end
    end

    def stage_7
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_7.order_by_modified
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_7.order_by_modified 
        end
    end

    def stage_8
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_8.order_by_modified_desc
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_8.order_by_modified_desc 
        end
    end

    def stage_9
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_9.order_by_modified_desc
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_9.order_by_modified_desc 
        end
    end

    def stage_10
        if is_agent?
            @candidates = Candidate.agent(session[:user_id]).stage_10.order_by_modified_desc
        else 
            @candidates = Candidate.recruiter(session[:user_id]).stage_10.order_by_modified_desc 
        end
    end


end
