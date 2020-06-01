class User::SessionsController < ApplicationController
    skip_before_action :redirect_if_not_authenticated, only: [:new, :create, :facebook]

    def new
        if user_authenticated 
            redirect_to candidates_path 
        else
            render :layout => "application"
            @user = User.new 
        end
    end 

    def create 
        @user = User.find_by(email: params[:email])

        # if @user 
        #     if @user.authenticate(params[:password])
        #         session[:user_id] = @user.id 
        #         redirect_to candidates_path
        #     else 
        #         flash[:alert] = "Password incorrect"
        #         render :new, :layout => "application"
        #     end
        # else 
        #     flash[:alert] = "User not found"
        #     render :new, :layout => "application"
        # end


        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            # user = User.find_by(id: session[:user_id])
            if is_agent?
                redirect_to agent_candidates_path(session[:user_id])
            else
                redirect_to recruiter_candidates_path(session[:user_id])
            end
            # redirect_to candidates_path 
        else
            flash[:alert] = "Email or Password incorrect"
            render :new, :layout => "application"
        end 
    end 

    def destroy 
        session.delete("user_id")
        redirect_to root_path
    end 

    def facebook
        @user = User.find_by(email: auth.info.email)
        
        if state == "Agent" || "Recruiter"
            if @user 
                session[:user_id] = @user.id 
                redirect_to candidates_path
            else 
                create_from_facebook
                if @facebook_user.save
                    session[:user_id] = @facebook_user.id 
                    redirect_to candidates_path
                else
                    redirect_to root_path, alert: "Something went wrong please try again."
                end
            end
        else 
            redirect_to root_path, alert: "Access from Facebook failed. Please try again."
        end
    end

    private 

    def auth 
        request.env['omniauth.auth']
    end

    def state
        request.env['omniauth.params']['state']
    end

    def create_from_facebook
        @facebook_user = state.constantize.new 
        @facebook_user.first_name = auth.info.first_name
        @facebook_user.last_name = auth.info.last_name
        @facebook_user.phone_number = ""
        @facebook_user.email = auth.info.email
        @facebook_user.password = SecureRandom.hex(12)
        @facebook_user.save
    end
    
end
