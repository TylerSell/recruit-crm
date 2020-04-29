class User::AgentsController < ApplicationController
    before_action :find_agent, only: [:index, :show, :edit, :update]
    
    def index
        @candidates = @agent.candidates
    end
    
    def new
        @agent = Agent.new
    end 

    def create
        @agent = Agent.create(agent_params)

        if @agent.save 
            session[:user_id] = @agent.id 
            redirect_to user_agents_path(@agent)
        else 
            render 'agent/new'
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

    def agent_params 
        pararms.require(:agent).permit(:first_name, :last_name, :phone_number, :email, :password)
    end 

    def find_agent
        @agent = Agent.find_by(id: params[:id])
    end

end