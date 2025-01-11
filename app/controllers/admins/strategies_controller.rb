class Admins::StrategiesController < ApplicationController
    def show
        @strategy = Strategy.find(params[:id])
        @game = @strategy.game
        @comment = @strategy.comments.new
    end
    
    def edit
        @strategy = Strategy.find(params[:id])
    end
    
    def new
        @strategy = Strategy.new
    end
        
    
    def create
      @strategy = Strategy.new(strategy_params)
      if @strategy.save
        redirect_to admins_strategy_path(@strategy.id), notice: 'Strategy was successfully created.'
      else
        render :new, alert: 'Failed to create strategy.'
      end
    end
    
    def destroy
        @strategy = Strategy.find(params[:id])
        @strategy.destroy
        redirect_to admins_game_path, notice: "攻略情報を削除"
    end

    
    def update
        @strategy = Strategy.find(params[:id])
        @strategy.update(strategy_params)
        redirect_to admins_strategy_path(@strategy.id)
    end
    
    private
    
    def strategy_params
        params.require(:strategy).permit(:title, :body, :game_id)
    end
end
