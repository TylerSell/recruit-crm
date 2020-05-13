class User::SessionsController < ApplicationController
    skip_before_action :redirect_if_not_authenticated, only: [:new, :create, :facebook]

    def new
        if user_authenticated 
            redirect_to candidates_path 
        else
            @user = User.new 
        end
    end 

    def create 
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to candidates_path 
        else 
            redirect_to root_path
        end 
    end 

    def destroy 
        session.delete("user_id")
        redirect_to root_path
    end 

    def facebook
        binding.pry
    end

    private 

    def auth 
        request.env['omniauth.auth']
    end

    def state
        request.env['omniauth.state']
    end
    
end
