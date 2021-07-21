class LeaguesController < ApplicationController
    def index
        @leagues = League.all
    end

    def new
        @league = League.new
    end

    def create
        @league = League.new(league_params)
        if @league.save
            redirect_to root_path
        else
            render :new
        end
    end

    private
    def league_params
        params.require(:league).permit(:Title, :Text)
    end
end
