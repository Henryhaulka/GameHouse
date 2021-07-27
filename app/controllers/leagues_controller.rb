class LeaguesController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :permission, only: [:edit, :update, :destroy]
    def index
        @leagues = League.all
    end

    def new
        @league = current_user.leagues.build
    end

    def show
        @league = League.find(params[:id])
        @vote = Vote.where(league_id: League.find(params[:id]))
    end

    def soccer
        @soccer = League.where(category_id: 1).order(created_at: :desc)
    end

    def car_racing
        @car_racing = League.where(category_id: 2).order(created_at: :desc)
    end

    def action
        @action = League.where(category_id: 3).order(created_at: :desc)
    end

    def adventure
        @adventure = League.where(category_id: 4).order(created_at: :desc)
    end

   
       


    def logic
        @logic = League.where(category_id: 5).order(created_at: :desc)
    end

    def other
        @other = League.where(category_id: 6).order(created_at: :desc)
    end

    def edit
        @league = League.find(params[:id])
    end


    def update
        @league = League.find(params[:id])
        if @league.update(league_params)
            redirect_to league_path
        else
            render :edit
        end
    end

    def create
        @league = current_user.leagues.build(league_params)
        @league.category_id = params[:category_id]
        if @league.save
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        @league = League.find(params[:id])
         @league.destroy
            redirect_to root_path 
    end

    
    private
    def permission
        @league = current_user.leagues.find_by(id: params[:id])
        redirect_to league_path, alert: 'You are not authorized to edit or delete this League' if @league == nil
    end

    def league_params
        params.require(:league).permit(:title, :text, :image)
    end
end
