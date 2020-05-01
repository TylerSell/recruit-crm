class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :redirect_if_not_authenticated 
    helper_methods :current_user, :agent, :user_authenticated

    # ----------------------PRIVATE METHODS BELOW----------------------------------

    private 

    def agent 
        current_user.type == "Agent" ? true : false
    end 

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end 

    def user_authenticated
        !!session[:user_id]
    end 

    def redirect_if_not_authenticated
        redirect_to root_path unless user_authenticated
    end

end
