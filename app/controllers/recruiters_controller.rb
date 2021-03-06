class RecruitersController < ApplicationController
    before_action :find_recruiter, only: [:index, :show, :edit, :update]
    skip_before_action :redirect_if_not_authenticated, only: [:new, :create]
    layout "sidebar"
    
    def index
        @candidates = @recruiter.candidates
    end
    
    def new
        @recruiter = Recruiter.new
        render :layout => "application"
    end 

    def create
        @recruiter = Recruiter.create(recruiter_params)

        if @recruiter.save 
            session[:user_id] = @recruiter.id 
            redirect_to recruiter_path(@recruiter)
        else 
            render 'recruiters/new', :layout => "application"
        end

    end 

    def show
    end 

    def edit 
    end 

    def update
        @recruiter.update(recruiter_params)
        
        if @recruiter.save 
            redirect_to recruiter_path(@recruiter)
        else 
            render :edit 
        end
    end 

# --------------------------PRIVATE METHODS---------------------------------------

    private 

    def recruiter_params 
        params.require(:recruiter).permit(:first_name, :last_name, :phone_number, :email, :password)
    end 

    def find_recruiter
        @recruiter = User.find_by(id: session[:user_id])
    end

end