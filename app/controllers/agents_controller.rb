class AgentsController < ApplicationController
    before_action :find_agent, only: [:index, :show, :edit, :update]
    skip_before_action :redirect_if_not_authenticated, only: [:new, :create]

    
    def index
        @candidates = @agent.candidates
    end
    
    def new
        if user_authenticated 
            if is_agent?
                redirect_to agent_path(session[:user_id])
            else 
                redirect_to recruiter_path(session[:user_id])
            end
        else
            @agent = Agent.new
        end
    end 

    def create
        @agent = Agent.create(agent_params)

        if @agent.save 
            session[:user_id] = @agent.id 
            redirect_to agent_path(@agent)
        else 
            render 'user/agents/new'
        end

    end 

    def show
    end 

    def edit 
    end 

    def update
        @agent.update(agent_params)
        redirect_to agent_path(@agent)
    end 

# --------------------------PRIVATE METHODS---------------------------------------

    private 

    def agent_params 
        params.require(:agent).permit(:first_name, :last_name, :phone_number, :email, :password)
    end 

    def find_agent
        @agent = User.find_by(id: session[:user_id])
    end

end