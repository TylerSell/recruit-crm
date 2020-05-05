class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :redirect_if_not_authenticated 
    helper_method :current_user, :is_agent?, :user_authenticated, :full_name

    # ----------------------PRIVATE METHODS BELOW----------------------------------

    private 

    def full_name
        "#{first_name} #{last_name}"
    end 

    def is_agent? 
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
