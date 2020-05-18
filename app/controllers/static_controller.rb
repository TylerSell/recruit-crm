class StaticController < ApplicationController
    skip_before_action :redirect_if_not_authenticated, only: [:home]
    layout "application"

    def home 
        if current_user 
            if is_agent? 
                redirect_to agent_path(current_user.id)
            else 
                redirect_to recruiter_path(current_user.id)
            end
        else 
            render :home
        end
    end 
    
end
