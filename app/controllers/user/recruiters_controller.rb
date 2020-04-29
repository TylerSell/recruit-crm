class User::RecruitersController < ApplicationController
    before_action :find_recruiter, only: [:index, :show, :edit, :update]
    
    def index
        @candidates = @recruiter.candidates
    end
    
    def new
        @recruiter = Recruiter.new
    end 

    def create
        @recruiter = Recruiter.create(recruiter_params)

        if @recruiter.save 
            session[:user_id] = @recruiter.id 
            redirect_to user_recruiters_path(@recruiter)
        else 
            render 'recruiter/new'
        end

    end 

    def show
    end 

    def edit 
    end 

    def update
    end 

# --------------------------PRIVATE METHODS---------------------------------------

    private 

    def recruiter_params 
        pararms.require(:recruiter).permit(:first_name, :last_name, :phone_number, :email, :password)
    end 

    def find_recruiter
        @recruiter = Recruiter.find_by(id: params[:id])
    end

end