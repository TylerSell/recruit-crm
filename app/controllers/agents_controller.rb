class AgentsController < ApplicationController
    before_action :find_agent, only: [:show, :edit, :update]
    skip_before_action :redirect_if_not_authenticated, only: [:new, :create]
    layout "sidebar"
    
    def new
        if user_authenticated 
            redirect_to candidates_path 
        else
            @agent = Agent.new
            render :layout => "application"
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