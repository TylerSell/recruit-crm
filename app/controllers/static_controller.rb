class StaticController < ApplicationController
    skip_before_action :redirect_if_not_authenticated, only: [:home]

    def home 
    end 
    
end
