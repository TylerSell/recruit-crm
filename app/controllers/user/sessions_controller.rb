class User::SessionsController < ApplicationController
    skip_before_action :redirect_if_not_authenticated, only: [:new, :create]

    def new
        if user_authenticated 
            if is_agent?
                redirect_to agent_path(session[:user_id])
            else 
                redirect_to recruiter_path(session[:user_id])
            end
        else
            @user = User.new 
        end
    end 

    def create 
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            if is_agent?
                redirect_to agent_path(@user.id)
            else 
                redirect_to recruiter_path(@user.id)
            end 
        else 
            redirect_to root_path
        end 
    end 

    def destroy 
        session.delete("user_id")
        redirect_to root_path
    end 
    
end
