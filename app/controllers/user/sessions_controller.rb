class User::SessionsController < ApplicationController
    skip_before_action :redirect_if_not_authenticated, only: [:new, :create]

    def new
        @user = User.new 
    end 

    def create 
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            if is_agent?
                redirect_to agent_path
            else 
                redirect_to recruiter_path
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
