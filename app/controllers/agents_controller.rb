class AgentsController < ApplicationController
    before_action :find_agent, only: [:index, :show, :edit, :update]
    skip_before_action :redirect_if_not_authenticated, only: [:new, :create]

    
    def index
        # @prospects = Candidate.all
        # @prospects.each do |candidate|
        #     if candidate.id == @agent.id 
        #         @candidates << candidate 
        #     end 
        # end 
    end
    
    def new
        @agent = Agent.new
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
        @agent = Agent.find_by(id: session[:user_id])
    end

end