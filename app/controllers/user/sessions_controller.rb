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
        @user = User.find_by(email: auth.info.email)

        if @user 
            session[:user_id] = @user.id 
            redirect_to candidates_path
        else 
            facebook_user = state.new 
            facebook_user.first_name = auth.info.first_name
            facebook_user.last_name = auth.info.last_name
            facebook_user.phone_number = ""
            facebook_user.email = auth.info.email
            facebook_user.password = SecureRandom.hex(12)
            facebook_user.save
            if facebook_user.save
                session[:user_id] = facebook_user.id 
                redirect_to candidates_path
            else
                redirect_to root_path
            end
        end 
    end

    private 

    def auth 
        request.env['omniauth.auth']
    end

    def state
        request.env['omniauth.params']['state']
    end

    def create_params

    end
    
end
