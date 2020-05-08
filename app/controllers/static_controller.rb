class StaticController < ApplicationController
    skip_before_action :redirect_if_not_authenticated, only: [:home]

    def home 
        if is_agent?
            redirect_to agent_path(current_user.id)
        elsif user_authenticated
            redirect_to recruiter_path(current_user.id)
        else 
            render :home 
        end
    end 
    
end
